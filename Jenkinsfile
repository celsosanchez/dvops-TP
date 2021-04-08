// Powered by Infostretch 

timestamps {

node () {

	stage ('ContinousIntegration - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b12a6328-cfb1-4b0d-b3c2-c49f7d0ae3f2', url: 'http://192.168.31.148/root/studentList']]]) 
	}
	stage ('ContinousIntegration - Build') {
 	
// Unable to convert a build step referring to "org.jenkinsci.plugins.dockerbuildstep.DockerBuilder". Please verify and convert manually if required.		// Shell build step
sh """ 
docker run -d -p 5000:5000 --network jenkins_default -h testapi --name testapi apiexam
sleep 1 
 """		// Shell build step
sh """ 
curl -u toto:python -X GET http://testapi:5000/pozos/api/v1.0/get_student_ages 
 """
// Unable to convert a build step referring to "org.jenkinsci.plugins.dockerbuildstep.DockerBuilder". Please verify and convert manually if required.
// Unable to convert a build step referring to "org.jenkinsci.plugins.dockerbuildstep.DockerBuilder". Please verify and convert manually if required.		// Shell build step
sh """ 
docker run -p 5432:5432 --network=jenkins_default -d --name db arminc/clair-db:2017-09-18
docker run -p 6060:6060 --network=jenkins_default --hostname clair --link db:postgres -d --name clair arminc/clair-local-scan:v2.0.6


clair-scanner --clair="http://clair:6060" --ip=clair apiexam 
 """ 
	}
}
}