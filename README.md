### 1. Deploy a Kubernetes Cluster
Plain Terraform was used as I was not familiar with Terragrunt; The Terraform files can be found in the "/terraform" folder.

`terraform init`<br>
`terraform apply`
<br><br>

### 2. Deploy a simple application on the Kubernetes Cluster
The code for the simple static web application can be found in the "/webapp" folder. The core of the folder is the Dockerfile that, upon building, creates an image that can be deployed into a Kubernetes cluster. The image is then deployed into the Kubernetes Cluster hosted on EKS.

The .yaml file used to deploy the web application can be found in "/kubernetes/webapp.yaml".

`kubectl apply -f kubernetes/webapp.yaml`

<br>
_Ingress setup is still in progress._
The Ingress Controller used in this solution is the AWS Load Balancer Controller that is deployed with Helm. The steps to deploy this Ingress Controller into EKS is as documented on the following website: https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html <br> <br>

An Ingress resource is then created and deployed to the EKS cluster to allow for traffic outside of the cluster to communicate with the web application.
_(Is Route53 required?)_
<br><br>

### 3. Integrate System Metrics with Elastic Cloud
Integration of Elastic Cloud with Kubernetes was done via the default sign-up steps when creating a new Elastic Cloud trial account.
