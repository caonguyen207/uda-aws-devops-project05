- This project extends from `uda-aws-devops-project04` (https://github.com/caonguyen207/uda-aws-devops-project04)

- To make docker image and run application in locally, run: `sh run_docker.sh`
  - To test request in locally:
    - Open postman or use curl command with: `http://localhost:80`
    - Execute prediction script: `sh make_prediction.sh`
- To push image to docker hub, run: `sh upload_docker.sh`
- To run in local K8S cluster.
  - Install and start `minikube`
  - Execute: `sh run_kubernetes.sh`

---
For testing on EKS clusters.
- Create new cluster name `aws-devops` by commands: `eksctl create cluster --name aws-devops --region=us-east-1 --nodes-min=2 --nodes-max=3 --zones=us-east-1a,us-east-1b`
- It will create 2 stacks in CloudFormation

- Build, tag and push the first image to Dockerhub.

- Login to EKS cluster and run first deployment also expose LB SVC
`aws eks update-kubeconfig --region us-east-1 --name aws-devops`

- Create new secret to pull image from Docker hub to EKS
`kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>`

- Run below commands:
`kubectl apply -f eks/deployment.yaml`
`kubectl apply -f eks/service.yaml`
`kubectl get pod`
`kubectl get svc`