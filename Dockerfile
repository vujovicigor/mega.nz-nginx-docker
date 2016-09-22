## USAGE:
## docker run -d --name MegaWeb --privileged -p 80:80 -e MegaUsername="YOUR-MEGA-EMAIL-ADDRESS" -e MegaPassword="YOUR-MEGA-PASSWORD" mega 
FROM ubuntu:14.04
MAINTAINER vujovichigor@gmail.com

WORKDIR /root
RUN apt-get update && apt-get install --yes libcrypto++-dev libcurl4-openssl-dev libdb5.1++-dev libfreeimage-dev libreadline-dev libfuse-dev make g++ git pkg-config nginx gettext && git clone https://github.com/matteoserva/MegaFuse
WORKDIR /root/MegaFuse
RUN make 
COPY megafuse.conf /root/MegaFuse/megafuse.template
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm /usr/share/nginx/html/50x.html
RUN rm /usr/share/nginx/html/index.html
EXPOSE 80

ENTRYPOINT envsubst < /root/MegaFuse/megafuse.template > /root/MegaFuse/megafuse.conf && service nginx start && /root/MegaFuse/MegaFuse 
