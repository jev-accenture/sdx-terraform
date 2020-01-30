name_prefix = "jev-dev"

# private network
vpc_id = "vpc-022d40f0a4dc4bb61"        # VPC: bootcamp (copy - past)
rtb_id = "rtb-0e53fdd2f93b3ca3f"        # Routing Table: bootcamp (copy - past)

private_network_cidr = "10.0.1.0/24"    # <-!!!!!!! set unique per person (10.0.<your_ip>.0)

# server configuration
image = "amzn2-ami-hvm-2.0.20191217.0-x86_64-ebs"   # Amazon Linux 2 AMI 2.0.20191217.0 x86_64 HVM ebs
