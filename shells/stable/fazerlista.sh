#!/usr/bin/env bash

#Fazendo uma variavel para criar o arquivo, caso não exista

arquivo="banco.txt"

#Variavel de cor
abrircor="\033[32;1m"
fecharCor="\033[m"

[[ ! -e "$arquivo" ]] && {

cat > "$arquivo" << EOF
"nome" , "telefone" , "idade"
EOF
} && echo -e "O ARQUIVO "$abrircor""$arquivo""$fecharCor" CRIADO COM SUCESSO!" || echo "Opah essse arquivo ja existe!"

#Comecano o LOOP para mandar dados para o arquivo

cedendo=("nome"  "telefone" "idade")
i=1
for dados in "${cedendo[@]}"; do
            while [[ -z "${dados[i]}" ]]; do
             read -p "${dados} " dados[$i]
             done
             ((i++))
done


#Verificando se existe o nome ja registrado!

if ! grep -iq "${dados[1]}" "$arquivo";then
         echo "${dados[1]^} , "${dados[2],,}" , "${dados[3],,}"" >> "$arquivo"
else
    echo "Ja existe o nome "${dados[1]}" Por isso não será armazenado no banco de dados novamente"
fi

