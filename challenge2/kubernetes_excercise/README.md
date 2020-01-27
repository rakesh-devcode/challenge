Step 1: Create ubuntu ec2 instance with following configuration.
            
            AMI	            Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
            Instance Type	t3.micro (2 vCPU, 1GB Memory)
            Storage	      8 GB (gp2)
            Security Group	Name: Minikube Security Group– SSH, 0.0.0.0/0 (Later we will be editing this.)
            Key Pair	Create your own keypair.
            You will need this to SSH to your EC2 Instance

Step 2: SSH into your created EC2 Instance using your keypair.
        
        ssh ubuntu@<ipv4_public_ip> -i <keypair>.pem

Step 3: Install kubectl on ec2 machine
         
         curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-                             release/release/stable.txt`/bin/linux/amd64/kubectl
         chmod +x ./kubectl
         sudo mv ./kubectl /usr/local/bin/kubectl

Step 4: Install docker on ec2 machine.

        sudo apt-get update && sudo apt-get install docker.io -y
   Minikube requires docker so need to install.

Step 5: Install MiniKube.
       
       curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv               minikube /usr/local/bin/

Step 6: Check minikube version.
        
        minikube version

Step 7: We have now successfully installed MiniKube and lets test it .

Step 8 : Become a root user and start Minikube in instance.

            sudo -i
            minikube start --vm-driver=none
         
Step 9: Check status of Minikube and it should be in running mode now.

         minikube status

Step 10: Lets run our container now.

        kubectl run nginx-hello-world --image=nginxdemos/hello --replicas=2 --port=8080
      
Step 11: Expose the container ports so that we can access it. 
          
          kubectl expose deployment nginx-hello-world --type=NodePort
      
Step 12: run below command and see the output it should looks like the same as mentioned in challenge.
         
         kubectl get all
  Notice the port of service nginx-hello-world.it could be any port.in my case it was 31525.

Step 13: Edit Security Group of the EC2 Instance to allow this port would be accessible from outside world.
         
         EC2 >> (Network & Security) Security Groups >> Minikube Security Group >> inbound
  Press Edit. Then Add Rule.
         
         Type	      Custom TCP Rule
         Protocol	      TCP
         Port Range	31525 (the port given to you by the kubectl get services command)
         Source	      0.0.0.0/0 (Accessible via the internet)
Click Save.

step 14: Access the our container via the EC2 Instance Port on a web browser.

         The address is <ipv4_public_ip>:<ec2_port>.
  My EC2 Instance has an IPv4 Public IP of 13.250.43.8. And since my hello-minikube port 8080 is exposed on port 31525, the address that I placed on my browser is 13.250.43.8:31525
  
  (In my case url didnt work.Need to fix the issue)





















