#!/usr/bin/env bash

# Agenda telefonica que busca informações de um bc de dados CSV
# 1 Armazenar o usuario no BC

#Variavel global
bc="bancoDeDados.txt"
#Cores
vermelho="\033[31;1m"
fecharCor="\033[m"
# Teste Inicial====

[[ ! -e "$bc" ]] && {
      cat > "$bc" <<EOF
#######'ID','cpf','nome' 'ddd' 'telefone'
EOF
}
#(($UID==0)) && { echo "Opah Root NÃOOOO! " ; exit 1;}
#FUnções
function adicionar(){
lista=("nome" "cpf" "telefone" "ddd")
i=1
            for dados in "${"$vermelho"lista[@]"$fecharCor"}" ; do
                        while [[ -z "${dados[i]}" ]] ; do
                              read -p "${dados}: " dados[$i]
                        done
                        ((i++))

            done

if ! grep -qo "${dados[2]}" "$bc"; then
            #Enviando para o BC
            dados[2]=$(sed 's/\.//g' <<< "${dados[2]}")
            ID="$(($(wc -l < "$bc")+1))" #Adicionando ID Unico com comando WC -l

            echo "${ID}, ${dados[1]}, ${dados[2]}, ${dados[3]}, ${dados[4]}," | tr 'A-Z' 'a-z' >> "$bc"
else
      echo "Saindo Do Programa!"
      exit 1
fi
}


##Buscar novo Contato!
function buscar(){
	if grep -qwio "$1" "$bc"; then
		for ((i="2"; i<=5; i++)); do
		for dados in "nome" "cpf" "ddd" "telefone"; do
			dados[$i]="$(grep "$1" "$bc")"
		done	
		done
		echo "${dados[$i]}"
	fi
}

function imprimir(){
	cat -n "$bc"
}


#MENU

case $1 in 
            -a|--adicionar)    shift ;    adicionar         ;; #Vai ser chamda a função ADICIONAR
            -b|--busca)        shift ;    buscar "$@"       ;; #Vai ser chamada a função buscar
            -i|--imprimir)     shift;    imprimir "$@"      ;; #vai ser chada a função imprimir
esac
