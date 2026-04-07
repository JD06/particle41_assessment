# Assessment
This repository is for assessment task for creating vpc and EKS cluster and deploying test python app

**Application**

```
 * Sample App provides ip address of the visitor with timestamp.
 ```

 **Requirements**

 ```
  * requirements.txt has the flask required for the application.
 ```
**Manifest**

```
* Kubernetes manifest file for pulling the image from dockerhub and deploying to the environment.
* Separate namespace
* Service kept as Nodeport, best to use service for the exposure to public.
```

***STEPS***

```
Action file takes care of the deployment, the action file has two jobs 
1. Plan
2. Apply (only plan is success)
```



```
**Requirements**
1. Configure AWS access in your local on downloading the aws cli and configure
#aws configure (Provide the access details)

2. S3 bucket for storing the stae file or for local this step can be skipped, highly recommend to use S3 as backend.
```
```
To run manually:
* From the terraform directory
# ./terraform
# terraform plan
(NOTE: If all the changes looks good, proceed next)

# terraform apply

```

* Once the cluster is up and runnign need to authenticate in order to connect with eks api and do operation

* `aws eks update-kubeconfig --name my-python-app-cluster --region us-east-1` in my lab i am using my-python-app-cluster as my cluster name and us-east-1 as region

* `kubectl get nodes`
* Once you are able to get the nodes, apply the deployment.yml file
* `kubectl apply -f deployment.yml`
* Image i have build in my local and pushed to dockerhub

**Check the deployment and service**

1. `kubectl get deployments -n python-app-space`
2. `kubectl get svc -n python-app-space`

Accessing the application after forwarding the traffic

`kubectl port-forward svc/ip-checker-service 5000:80 -n python-app-space`

![Alt Text](assets/app.png)