■Set-Up
1. Create S3 for tfstate
ex)example-dev-alb-accesslog-bucket

■Resources
<br />
EC2(web) x 1 
<br />
ALb x 1(HTTP Listener only)
<br />
RDS x 1
<br />
WAF x 1

■Deploy
1. Move prod directory
2. terraform init
3. terraform plan
4. terraform apply