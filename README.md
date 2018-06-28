# Выполнено ДЗ №4

 - [X] Основное ДЗ
    Файлы созданы
 - [X] Дополнительные задания
  - Работа с Firewall через gcloud

`gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --target-tags=puma-server`

  - startup script
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script='#!/bin/sh
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo cat <<EOF> /etc/apt/sources.list.d/mongodb-org-3.2.list
deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse
EOF
sudo apt-get update
sudo apt-get install -y mongodb-org ruby-full ruby-bundler build-essential
sudo systemctl start mongod
sudo systemctl enable mongod
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
bundle install
puma -d'
```

## В процессе сделано:
 - ничего интересного

## Как проверить работоспособность:
 - Не требуется

## PR checklist
 - [X] Выставил label с номером домашнего задания
 - [X] Выставил label с темой домашнего задания

## IP адреса

bastion_IP = 35.198.167.169

someinternalhost_IP = 10.164.0.3

testapp_IP = 35.204.67.191

testapp_port = 9292
