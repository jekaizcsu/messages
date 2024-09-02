#! /bin/bash
first_name=0 # имя пользователя
last_name=0 # фамилия пользователя
times=0 # время когда логинился пользователь
d=0 # дата успешного входа
sudo cp /var/log/messages* /home/evb/ # копируем все интересующие файлы в мою домашнюю директорию
sudo chmod 777 /home/evb/messages* # делаем файлы читаемыми
sudo rm /var/tmp/logins_* # предварительно удаляем ранее созданные файлы

grep -h "SUCCESS LOGIN" /home/evb/messages* | while read line; do
	first_name=`echo $line | cut -d " " -f14`; last_name=`echo $line | cut -d " " -f15`; times=`echo $line | cut -d " " -f3`; d=`echo $line | cut -d " " -f6`
	echo $times $first_name $last_name >> "/var/tmp/logins_$d"
done
