name_prefix = "student"                 # <-!!!!!!! set your name !!!!!!

# private network
vpc_id = "vpc-022d40f0a4dc4bb61"        # VPC: bootcamp (copy - past)
rtb_id = "rtb-0e53fdd2f93b3ca3f"        # Routing Table: bootcamp (copy - past)

private_network_cidr = "10.0.1.0/24"    # <-!!!!!!! set unique per person !!!!!!

# server configuration
count = "3"
image = "amzn2-ami-hvm-2.0.20191217.0-x86_64-ebs"   # Amazon Linux 2 AMI 2.0.20191217.0 x86_64 HVM ebs
flavor = "t2.micro"                                 # Linux vCPU(1), RAM(1 GiB), HDD(0 GB)
ssh_key_file = "~/.ssh/id_rsa"

