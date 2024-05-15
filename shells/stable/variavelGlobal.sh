 #!/usr/bin/env bash

 echo -e "opah \033[31;1m"${USER^^}"\033[m seja bem vindo ao programa!\nPara começarmos digite a chave
\033[33;1mVocê terá 10 segundos para fazer isso\033[m"
sleep 5s

read -t 5 entradaChave
 [[ "$chave" !=  "$entradaChave" ]] && { echo "A chave esta errada ou faltou a chave"; echo "Saindo do programa";exit 1 ;}  || echo "A chave esta certa!"