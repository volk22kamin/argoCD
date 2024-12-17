kubectl cp jenkins_backup/jobs/. jenkins/jenkins-0:/var/jenkins_home/jobs/.
kubectl cp jenkins_backup/users/. jenkins/jenkins-0:/var/jenkins_home/users/.
kubectl cp jenkins_backup/credentials.xml jenkins/jenkins-0:/var/jenkins_home/credentials.xml
kubectl cp jenkins_backup/config.xml jenkins/jenkins-0:/var/jenkins_home/config.xml
