# Выполнено ДЗ №3

 - [X] Основное ДЗ
    `ssh -t -A reuuke@35.204.67.191 ssh 10.164.0.3`
 - [X] Задание со *
    ```
    cat << EOF >> ~/.ssh/config
    Host bastion
      Hostname 35.204.67.191
      User reuuke
    Host someinternalhost
      Hostname 10.164.0.3
      User reuuke
      ProxyJump bastion
    EOF
    ```

## В процессе сделано:
 - Регистрация в GCP
 - Все пункты по ДЗ

## Как проверить работоспособность:
 - Не требуется

## PR checklist
 - [X] Выставил label с номером домашнего задания
 - [X] Выставил label с темой домашнего задания

## IP адреса

bastion_IP = 35.204.67.191

someinternalhost_IP = 10.164.0.3

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

testapp_IP = 35.204.67.191

testapp_port = 9292

# Выполнено ДЗ №5
  
 - [X] Основное ДЗ
    Создан образ "reddit-base"
 - [X] Дополнительные задания
  - создан образ "reddit-full"
  - добавлен файл "create-redditvm.sh"

## В процессе сделано:
 - разобрался с systemd units

## Как проверить работоспособность:
 - Запустить VM из образа reddit-full

## PR checklist
 - [X] Выставил label с номером домашнего задания
 - [X] Выставил label с темой домашнего задания
 
# Выполнено ДЗ №6
  
 - [X] Основное ДЗ
 - [X] Самостоятельные задания
 - [X] Задание со *
  - Метаданные перезаписываются
 - [X] Задание с **
  - Добавлен базовый балансировщик с простой проверкой
  - Адаптировно всё под указание count

## В процессе сделано:
 - Изучение "google_compute_region_backend_service" и всё что связано с ним. Но "google_compute_region_instance_group.reddit-backend: Provider doesn't support resource: google_compute_region_instance_group"
 - Сделал стандартным "google_compute_target_pool"
 
## Как проверить работоспособность:
 - terraform apply 

## PR checklist
 - [X] Выставил label с номером домашнего задания
 - [X] Выставил label с темой домашнего задания

# Выполнено ДЗ №7

 - [X] Основное ДЗ
 - [X] Самостоятельные задания
 - [X] Задание со *
  - backend.tf добавлен и проверен
 - [] Задание с **

## В процессе сделано:
 - Изучение документации по backend
 - Изучение документации по созданию своих provider

## Как проверить работоспособность:
 - terraform apply
 - travis-ci

## PR checklist
 - [X] Выставил label с номером домашнего задания
 - [X] Выставил label с темой домашнего задания
