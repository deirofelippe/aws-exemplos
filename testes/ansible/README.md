docker container ls -a
docker container rm -f $(docker container ls -a -q)
docker container run -d --name test -p 3000:80 rastasheep/ubuntu-sshd:18.04
docker container inspect test -f '{{json .NetworkSettings.IPAddress}}'
ssh-keygen -t rsa -f ~/.ssh/ansible-test
ssh-copy-id -i ~/.ssh/ansible-test.pub root@172.17.0.2

ansible-playbook -i hosts main.yaml

##

ssh
nodejs
npm install
pm2
sobe ou da git clone?

ansible inventario dinamico

make clear-and-config
make clear
make init
senha ssh: root

app.127.0.0.1.nip.io:3000

apt update -y && \
apt upgrade && \
apt install -y openssh-server ufw && \
service ssh start && \
service ssh status && \
ufw enable
ufw status
ufw allow 22/tcp

##

artigo so com docker q simula aws
artigo so com aws

container que instala nginx
dockerfile com debian ssh (xampp imagem)
usar o front e banco no dockeraqui

terraform q cria ec2, rds e s3
configura ec2 (nginx load balancer, 2 instancias ec2)






ansible, nginx, docker compose
ansible, terraform, ec2, rds
