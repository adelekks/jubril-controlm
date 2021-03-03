# Define SSH key pair for our instances
#resource "aws_key_pair" "default" {
#  key_name = "ken-mac"
#  public_key = "${file("${var.key_path}")}"
#}

# Define control-m inside the public subnet
resource "aws_instance" "control-m" {
   ami  = "${var.ami}"
   instance_type = "t2.medium"
   key_name = "Kenny-mac"
#   key_name = "${aws_key_pair.default.id}"   
   subnet_id = "${var.public_subnet}"
   vpc_security_group_ids = [
     var.sg_bitbucket,
     var.sg_jenkins
   ]
   associate_public_ip_address = true
   source_dest_check = false

   ebs_block_device {
     device_name = "/dev/xvdb"
     volume_type = "gp2"
     volume_size = 10
   }

   connection {
     type        = "ssh"
     user        = "ec2-user"
     private_key = "${file("${var.key_path_priv}")}"
     host        = self.public_ip
   }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
      "sudo yum -y install python-pip python-devel python",
      "sudo pip install ansible==2.4.2"
    ]
  }

   provisioner "remote-exec" {
     inline = [
       "sudo docker run -dit --restart unless-stopped bitbucket",
       "sudo docker ps -a"
     ]
   }

   tags = {
    Name = "control-m"
  }
}
