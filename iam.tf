resource "aws_iam_role" "ec2-role" {
    name= "mrinal14-demo-ec2-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role_policy" "s3-access" {
    name = "mrinal14-demo-ec2-role-policy"
    role = aws_iam_role.ec2-role.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "s3:ListBucket"
                ]
                Effect   = "Allow"
                Resource = aws_s3_bucket.demo.arn
            },
            {
                Action = [
                    "s3:GetObject",
                    "s3:PutObject"
                ]
                Effect   = "Allow"
                Resource = "${aws_s3_bucket.demo.arn}/*"
            }
        ]
    })
}

# This is required for associating role with EC2 instance
resource "aws_iam_instance_profile" "ec2-instance-profile" {
    name = "mrinal14-demo-ec2-instance-profile"
    role = aws_iam_role.ec2-role.name
}