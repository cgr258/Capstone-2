provider "aws" {
  region = "ap-south-1"
    access_key = "***************"
    secret_key = "***************************"
}
resource "aws_instance" "K8s-Slave1" {
  ami = "ami-0c2af51e265bd5e0e"
  instance_type = "t2.medium"
  key_name = "Apple-Key(Mumbai)"
  tags = {
    Name = "M2-Slave"
  }
}
resource "aws_instance" "K8s-Master" {
  ami = "ami-0c2af51e265bd5e0e"
  instance_type = "t2.medium"
  key_name = "Apple-Key(Mumbai)"
  tags = {
    Name = "M3-Master"
  }
}
resource "aws_instance" "K8s-Slave2" {
  ami = "ami-0c2af51e265bd5e0e"
  instance_type = "t2.medium"
  key_name = "Apple-Key(Mumbai)"
  tags = {
    Name = "M4-Slave"
  }
}
