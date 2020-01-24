Step 0: Create ec2 instance 

Step 1: install AWSCLI

Step 2: Install kubectl on windows/linux/ubuntu instance.(Refer docs).I have used Kops and cube for ubuntu.

Step 3: Install kops on ubuntu instance

Step 4: Attach IAM role to ubuntu instance

Step 5: create a S3 bucket

Step 6: Expose environment variable.

Step 7 : Create sshkeys before creating cluster.

Step 8: Create kubernetes cluster definitions on S3 bucket using kops.

Step 9: Create kubernetes cluser using below command:
      kops create cluster --cloud=aws --zones=ap-south-1b --name=demo.k8s.valaxy.net --dns-zone=valaxy.net --dns private
      # update the cluster
      kops update cluster demo.k8s.valaxy.net --yes
      
Step 10: Validate your cluster as below: 
      kops validate cluster

Step 11: Deploying Nginx pods and container on Kubernetes
          1. kubectl run sample-nginx --image=nginx --replicas=2 --port=80
          2. kubectl get pods
          3. kubectl get deployments
          4. kubectl expose deployment sample-nginx --port=80 --type=LoadBalancer
          5. kubectl get services -o wide

Step 13: Expose the deployment as service. This will create an ELB in front of those 2 containers and allow us to publicly access them.




















