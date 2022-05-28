
# DevOps_Task

This is my repo for solving  task for creating CI/CD for WP app.
I used AWS as cloud provider and the tools Git ,K8S and Jenkins to achieve this goal.
 1. Git as source code management.
 2. K8S as a automating deployment, scaling, and management of containerized applications.
 3. Docker as conatiner engine.
 4. AWS S3 Service.
 5. Jenkins as pipeline orchestration to orcheste.
 
## Steps

### Jenkins


* Install git command line in your local env
* Install Jenkins server to trigger the updates in My GitHub repo by
“Web Hook” and Deploy the updates to containers.
* Install Docker and Git on Jenkins Server.
* Install Kubernetes Cluster as a platform or use EKS service in AWS to deploy containers and orchestrate my action in these containers.
* Deployed the HPA for Autoscaling.
* Use AWS account to create S3 bucket that will contain APP
backup.
* Create Your Docker Hub account or Use ECR service at AWS.
* Jenkins must have Github , Docker Hub , Kubernetes Cluser credentials.
* From Jenkins UI integrate GitHub With Jenkins.

* We have now have (aws-access-key, aws-secret-access-key) from AWS console, (database-password, rootdb-password) new generated.

* update these values in the files secret.yml, configmap-wordpress.yml, mysql.yml
* Deploy secret and mysql yml files.

```
kubectl create -f secret.yml
kubectl create -f configmap-wordpress.yml
kubectl create -f mysql.yml
```

*  Deploy Wordpress HPA and PV yml file.
```
kubectl create -f hpa-wordpress.yml
kubectl create -f pv-wordpress.yml
```

* Now mysql pods , services, hpa, secret, pv, pvc by using command :

```
kubectl get pods,svc,hpa,secret
```

* In Jenkins UI create CICD Pipeline.

* Create Jenkins new item with name for example “CICD-wordpress” and
“multibranch pipeline”

* In GitHub section add your credentials - Owner “Github user” - You
Repo that Forked from My Repo.

* In Build Configuration chose Jenkinsfile.

* Check the pipeline steps You will find the Code deployed first in Canary
pods to test it and you can check it through the browser by accessing
this link : http://k8s_node_ip:8082


* Backup DB : Access to AWS console with your Account permission and create S3 bucket called for example “db-bucket-wp-backup” >> make it public and
choice the region that you need for example “ohio >> us-east-2”
Also Create folder called for example “database” inside the bucket.

* in k8s master node Edit and start to deploy Mysql DB backup ymal file. update file backup-mysql.yml in values AWS_DEFAULT_REGION, AWS_BUCKET_NAME, AWS_BUCKET_BACKUP_PATH, schedule " rely on your backup time"

* To deploy backup run the command :
```
kubectl create -f backup-mysql.yml
```