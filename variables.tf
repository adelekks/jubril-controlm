variable "aws_region" {
  description = "Region for the VPC"
  default = "us-west-2"
}

variable "sg_bitbucket" {
  description = "sg bitbucket"
  default = "sg-00b2deb1ef6de2b93"
}

variable "sg_jenkins" {
  description = "sg_jenkins"
  default = "sg-07084e4cf26ab6bb0"
}

variable "public_subnet" {
  description = "Public subnet"
  default = "subnet-0811b5906fc4c3c64"
}

variable "ami" {
  description = "Amazon RedHatLinux AMI"
  default = "ami-00aa0a1b208ece144"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "key_path_priv" {
  description = "SSH private Key path"
  default = "~/.ssh/id_rsa"
}
