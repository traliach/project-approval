#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -x

# Install necessary packages
sudo apt-get update -y
sudo apt-get install -y default-jre unzip python3-pip postgresql postgresql-contrib wget

# Install Terraform
sudo apt-get update -y && sudo apt install openjdk-11-jdk -y
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y && sudo apt-get install terraform -y
sudo mv terraform /usr/local/bin

# Install kubectl
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.27/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.27/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubectl

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install

# Install SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.6.1.59531.zip -O /tmp/sonarqube.zip
sudo unzip /tmp/sonarqube.zip -d /opt
sudo ln -s /opt/sonarqube-9.6.1.59531 /opt/sonarqube

# Verify SonarQube files
if [ ! -f /opt/sonarqube/bin/linux-x86-64/sonar.sh ]; then
  echo "SonarQube binary not found!" | sudo tee /var/log/sonarqube_install.log
  exit 1
fi

# Create a SonarQube system user
sudo useradd -r -s /bin/false sonarqube
sudo chown -R sonarqube:sonarqube /opt/sonarqube*

# Backup and update SonarQube configuration
sudo cp /opt/sonarqube/conf/sonar.properties /opt/sonarqube/conf/sonar.properties.bak
sudo sed -i 's/^#sonar.jdbc.username=.*/sonar.jdbc.username=sonar/' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's/^#sonar.jdbc.password=.*/sonar.jdbc.password=sonar/' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's@^#sonar.jdbc.url=jdbc:postgresql://localhost/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance@sonar.jdbc.url=jdbc:postgresql://localhost/sonar@' /opt/sonarqube/conf/sonar.properties

# Configure PostgreSQL
sudo -u postgres psql -c "CREATE USER sonar WITH PASSWORD 'sonar';"
sudo -u postgres createdb -O sonar sonarqube

# Enable and start PostgreSQL
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Ensure sonar.sh is executable
sudo chmod +x /opt/sonarqube/bin/linux-x86-64/sonar.sh

# Create systemd service for SonarQube
sudo bash -c 'cat > /etc/systemd/system/sonarqube.service <<EOF
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonarqube
Group=sonarqube
Restart=always
LimitNOFILE=65536
LimitNPROC=4096
TimeoutStartSec=5

[Install]
WantedBy=multi-user.target
EOF'

# Reload systemd to apply the new service
sudo systemctl daemon-reload

# Enable and start SonarQube service
sudo systemctl enable sonarqube
sudo systemctl start sonarqube

# Verify SonarQube installation
sleep 60 # Wait for SonarQube to start
if curl -s http://localhost:9000 | grep -q "SonarQube"; then
  echo "SonarQube is successfully installed and running." | sudo tee /var/log/sonarqube_install.log
else
  echo "SonarQube installation failed." | sudo tee /var/log/sonarqube_install.log
fi

# Install Maven
MAVEN_VERSION=3.8.7
wget https://archive.apache.org/dist/maven/maven-3/3.8.7/binaries/apache-maven-3.8.7-bin.zip -O /tmp/maven.zip
sudo unzip /tmp/maven.zip -d /opt
sudo ln -s /opt/apache-maven-3.8.7 /opt/maven

# Set up Maven environment variables
sudo bash -c 'cat > /etc/profile.d/maven.sh <<EOF
export M2_HOME=/opt/maven
export PATH=/opt/maven/bin:\$PATH
EOF'
source /etc/profile.d/maven.sh

# Verify Maven installation
mvn -version | sudo tee /var/log/maven_install.log
