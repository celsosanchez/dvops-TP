// Powered by Infostretch 

timestamps {

node () {

	stage ('CIntegration - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '43c89ef8-0d8b-455f-a5b8-a2e6be160c11', url: 'http://192.168.31.148/root/studentList.git']]]) 
	}
	stage ('CIntegration - Build') {
 			// Shell build step
sh """ 
docker build -t 192.168.31.21:5000/apiexam /opt/bitnami/jenkins/jenkins_home/workspace/CIntegration 
 """		// Shell build step
sh """ 
#docker run -p 5432:5432 --network=jenkins_default -d --name db arminc/clair-db:2017-09-18
#docker run -p 6060:6060 --network=jenkins_default --link db:postgres -d --name clair arminc/clair-local-scan:v2.0.6


#clair-scanner --clair="http://clair:6060" --ip=jenkins_jenkins_1 apiexam 
 """		// Shell build step
sh """ 
docker run -d -p 5000:5000 --network jenkins_default -h testapi --name testapi 192.168.31.21:5000/apiexam
sleep 1
curl -u toto:python -X GET http://testapi:5000/pozos/api/v1.0/get_student_ages 
 """		// Shell build step
sh """ 
docker stop testapi
docker rm testapi 
 """		// Shell build step
sh """ 
#docker scan 192.168.31.21:5000/apiexam 
 """		// Shell build step
sh """ 
docker push 192.168.31.21:5000/apiexam 
 """		// Shell build step
sh """ 
ansible app -i $WORKSPACE/ansible/hosts -m ping 
 """		// Shell build step
sh """ 
#docker pull php:apache
docker tag php:apache 192.168.31.21:5000/php:apache
docker push 192.168.31.21:5000/php:apache 
 """		// Shell build step
sh """ 
ansible-playbook -i $WORKSPACE/ansible/hosts $WORKSPACE/ansible/deploy-app.yml 
 """ 
	}
}
}