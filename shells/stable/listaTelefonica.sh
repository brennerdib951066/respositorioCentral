#!/usr/bin/env bash
#chamada configuracao
source documento.txt


#Chamando a função adicionar
if [[ "$UID" -ne "0" ]]; then
        { echo -e "Opah apenas \033[31;1mSUPER USUARIO\033[m poderá chamar esse PROGRAMA\nSaindo do \033[31;1mPrograma\033[m"; exit 1 ;}
else
#Inserido valor na variavel
arquivo="lista.txt"
#Verificando se existe o arquivo, caso não exista cria-lo
[[ ! -e "$arquivo" ]] && { cat >> "$arquivo" <<EOF
NOME, SOBRENOME, TELEFONE , CPF

EOF
} && echo -e "O arquivo com nome \033[32;1m"$arquivo"\033[m! foi criado com sucesso!" || { echo -e "Opah esse arquivo ja existe!\nConcedendo tempo para você ler!"; sleep 5s ;}
fi

#Chamar a funcao com case MENU

case $1 in
        -a|--adicionar) adicionar ;;
        -h|--help) ajuda          ;;
        *) echo -e "Opah Dê algum \033[31;1m PARAMETRO\033[m"

esac
