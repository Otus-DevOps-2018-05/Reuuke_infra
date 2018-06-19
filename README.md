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

bastion_IP = 35.198.167.169
someinternalhost_IP = 10.164.0.3
