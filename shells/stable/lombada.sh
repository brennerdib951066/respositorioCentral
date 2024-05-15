#!/usr/bin/env bash

#entrada input de limite de velocidade
echo -e "\033[35;1mBem-vindo a lambada\033[m\nLembrando que o limite dessa rodovia é de \033[31;1m80\033[m! Porém poderas ultrapassar 5 de 80\nPodes chegar até \033[31;1m85\033[m"
sleep 3s

read -p "Qual é sua velocidade no momento?  " limiteVelocidade

if (( "$limiteVelocidade" <= 80 )); then
    echo "Opah! Estás andando bem"
elif (( "$limiteVelocidade" >= 81 && "$limiteVelocidade" < 85 )); then 
    echo "Alerta! Você está no limite!"
else
    echo "Multa por ultrapassar o limite de velocidade"
fi