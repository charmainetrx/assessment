### 1. Deploy a Kubernetes Cluster
Plain Terraform was used as I was not familiar with Terragrunt; The Terraform files can be found in the "/terraform" folder.

`terraform init`<br>
`terraform apply`
<br><br>

### 2. Deploy a simple application on the Kubernetes Cluster
The .yaml file used to achieve this can be found in "/kubernetes/webapp.yaml".

`kubectl apply -f kubernetes/webapp.yaml`

_Ingress setup is still in progress._
<br><br>

### 3. Integrate System Metrics with Elastic Cloud
Integration of Elastic Cloud with Kubernetes was done via the default sign-up steps when creating a new Elastic Cloud trial account.
