<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*ig_nWLtln7ybZO_yrQHUCg.png">
<sup>Source: https://towardsdatascience.com/how-to-set-up-ingress-controller-in-aws-eks-d745d9107307</sup>
<br>

### 1. Deploy a Kubernetes Cluster
<p>Plain Terraform was used to deploy the AWS resources as I was not familiar with Terragrunt; The Terraform files can be found in the "/terraform" folder.</p>

Commands to deploy to AWS:<br>
`terraform init`<br>
`terraform apply`
<br><br>

### 2. Deploy a simple application on the Kubernetes Cluster
<p>The code for the simple static web application can be found in the "/webapp" folder. The core of the folder is the Dockerfile that, upon building, creates an image that can be deployed into a Kubernetes cluster. The image is then published to a public Docker Hub repository and deployed into the Kubernetes Cluster hosted on EKS.</p>

<p>The .yaml file used to deploy the web application can be found in "/kubernetes/webapp.yaml" and the Docker image can be found in the following link: https://hub.docker.com/repository/docker/charmainetrx/assessment/general</p>

Command to deploy the web application to EKS:<br>
`kubectl apply -f kubernetes/webapp.yaml`

<br>
<p>The Ingress Controller used in this solution is the AWS Load Balancer Controller that is deployed with Helm. The steps to deploy this Ingress Controller into EKS is as documented on the following website: https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html</p>

<p>An Ingress resource is then created and deployed to the EKS cluster to allow for traffic outside of the cluster to communicate with the web application.</p>

Command to deploy the ingress to EKS:<br>
`kubectl apply -f kubernetes/ingress.yaml`

<i>(Encountered an issue with Route53, unable to get a domain.)</i>
<br><br>

### 3. Integrate System Metrics with Elastic Cloud
<p>Integration of Elastic Cloud with Kubernetes was done via the default sign-up steps when creating a new Elastic Cloud trial account. This involves a deployment of an elastic agent as configured in "/kubernetes/elastic-agent.yaml" to allow the Elastic instance to pull data from the EKS cluster.</p>

Command to deploy Elastic agent to EKS:<br>
`kubectl apply -f kubernetes/monitoring/elastic-agent.yaml`

<p>Metricbeat was also deployed into the EKS cluster to gather metrics from the pods. The below image shows a simple dashboard from the gathered metrics.</p>

Commands to deploy Metricbeat to EKS:<br>
`kubectl apply -f kubernetes/monitoring/kube-state-metrics.yaml`<br>
`kubectl apply -f kubernetes/monitoring/metricbeat.yaml`<br>
<br>
<img src="https://i.imgur.com/v7VgDHf.png">
