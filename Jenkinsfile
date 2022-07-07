pipeline {
    agent any
    stages{
        stage('Git Clone'){
            steps{
                git branch: 'main', url: 'https://github.com/Midguar11/GameOfLife.git'
            }
        }

          stage('Maven Complie'){
            agent any
            steps{
                sh 'mvn compile'
            }
        }
        
        stage('Maven Test'){
            agent any
            steps{
                sh 'mvn test'
            }
        }
        
        stage('Maven Package'){
            agent any
            steps{
                sh 'mvn package'
            }
        }
        
        stage('Maven Deploy in docker and App to running in tomcat '){
            steps{
             sh '''alias docker=\'sudo docker\'
sudo rm -rf dockerimg
docker rm -f tomcatwebserver
mkdir dockerimg 
cd dockerimg
cp /var/lib/jenkins/workspace/Practice/Continous_Deployment/target/gameoflife.war .
touch dockerfile
cat "2Angle Brackets"EOT "2Angle Brackets"  dockerfile
FROM tomcat
ADD gameoflife.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
EXPOSE 8080
EOT
docker build -t tomcat:1.0 . 
docker run -itd --name tomcatwebserver -p 8888:8080 tomcat:1.0'''
            }
        }
    }
}