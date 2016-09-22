# mega.nz-nginx-docker
This docker image will mount mega.nz files to nginx.

1.Pull image from dockerhub:

`docker pull vujovichigor/mega`

OR 

clone github repo and build docker image locally:

`docker build -t mega .`

2.Start container (replace YOUR-MEGA-EMAIL-ADDRESS/YOUR-MEGA-PASSWORD with your mega user/pass):

`docker run -d --name MegaWeb --privileged -p 80:80 -e MegaUsername="YOUR-MEGA-EMAIL-ADDRESS" -e MegaPassword="YOUR-MEGA-PASSWORD" mega`
