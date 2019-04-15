#!/bin/bash

for NOME in $(getent passwd | awk -F: '$3 >= 1000 { print $1 }' | egrep -v "nobody|vagrant|suporte")
do
		echo $NOME Criando diretório
		maildirmake /home/${NOME}/maildir
		maildirmake /home/${NOME}/maildir/.Enviados
		maildirmake /home/${NOME}/maildir/.Rascunhos
		maildirmake /home/${NOME}/maildir/.Lixeira
		maildirmake /home/${NOME}/maildir/.SPAM
		echo $NOME alterando o dono
		chown ${NOME}: /home/${NOME} -R

done
