# Trace AMI ID (latest) from AWS
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter{
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  key_name      = aws_key_pair.demo.key_name

  vpc_security_group_ids = [aws_security_group.web.id]

  iam_instance_profile = aws_iam_instance_profile.ec2-instance-profile.name

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash 
 
              apt-get update -y 
 
              apt-get install -y nginx unzip

              curl -fsSL https://awscli.amazonaws.com/v2/install.sh | sudo bash -s -- --system
 
              systemctl enable nginx 
              systemctl start nginx 
 
              echo "<h1>Hello from Terraform EC2</h1>" > /var/www/html/index.html 
              EOF 


  tags = {
    Name = "mrinal14-demo-ec2-instance"
  }
}

resource "aws_key_pair" "demo" {
  key_name   = "mrinal14-demo-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}