# appd_aws_modernization_lab

Artifacts for AppDynamics AWS Cloud Modernization lab.

After creating your Cloud9 instance and configuring it by following all the steps included in these web pages:

https://appd-modernization.awsworkshop.io/30_workshop_setup.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/1_create_cloud9.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/2_create_iam_role.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/3_attach_iam_role.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/4_cloud9_update.html


Then use the commands below to finish setting up the pre-modernization version of the lab:

```
git clone https://github.com/Appdynamics/appd_aws_observability_lab.git modernization_workshop
```

```
cd modernization_workshop
```

```
chmod +x setup_workshop.sh
```

Set lab user id to at least 5 character name
```
export appd_workshop_user=xxxxx
```

OPTIONAL: If you want to target your own controller then edit the '/home/ec2-user/environment/modernization_workshop/controller-config.yaml' file with your controller details and the user and password for a controller user that has 'Account Owner' role assigned.  Then set the variable that points to the 'controller-config.yaml' file like this

```
export appd_controller_details_file_path=./controller-config.yaml
```

Then run the setup script with the command below which performs the tasks listed in the link below:
https://appd-modernization.awsworkshop.io/30_workshop_setup/5_start_engines.html#what-the-setup-utility-does
Note: The initial setup takes about 24 minutes to complete

```
./setup_workshop.sh
```

Once the initial setup has completed, then next step is to create the EKS cluster with the commands below:
Note: The EKS cluster creation takes about 15 minutes to complete

```
/home/ec2-user/environment/modernization_workshop

./create_eks_cluster.sh
```

Once the EKS cluster creation has completed, then next step is to deploy the 'post-modernization' application the EKS cluster with the commands below:

```
/home/ec2-user/environment/modernization_workshop

./deploy_eks_application.sh
```

Once the 'post-modernization' application deployment has completed, then next step is to deploy the AppDynamics Agents with the commands below:

```
/home/ec2-user/environment/modernization_workshop

./deploy_appdynamics_agents.sh
```

Now it's time to work through the observability sections of the workshop lab guide - TBD




PLEASE! When you are finished with the workshop, kindly run the 'teardown_workshop.sh' script to delete all the resources in AWS and the AppDynamics Controller that were created during the workshop by using the commands below:

```
/home/ec2-user/environment/modernization_workshop

./teardown_workshop.sh
```

