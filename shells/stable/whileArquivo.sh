#!/usr/bin/env bash
arquivoFiltrado="/home/brenner/Downloads/viverBemPlanilhas/txts/superFiltrado4.txt"
criarArquivos="/home/brenner/Downloads/viverBemPlanilhas/txts/filtradinhoCesar.txt"

# Verificações
((UID==0)) && { echo "\E[31;1mNão aceito root\E[m"; sleep 1s ; exit 1 ;}

read -p $'\E[31;1mArquivo de comparação:\E[m   ' arquivoComparado
minuscula(){
	while IFS= read linha; do
		linha=${linha,,}
		{ echo -e "\E[34;1mEnviando a linha agora\E[m";}
		echo "${linha}"
		echo "${linha//\"/}" >> recebiLower.txt
	done < "${arquivoComparado}"
}
minuscula # Chamando a função minuscula

#while IFS= read linha; do
#    grep -i "${linha,,}" ${arquivoComparado} && { head -n10 ${arquivoFiltrado}; echo -e "\E[31;1mO nome ${linha} já Contêm\E[m" ;}\
#    || { ((ic++)); printf "${linha,,}\n">> "${criarArquivos}"; echo "Enviado pro arquivo!" ;}
#    ((if++))

#done < $arquivoFiltrado
#source "bibliotecas/whatsApp.txt"
#avisos=("\E[37;1m Total De linhas = ${i}\E[m" "\E[37;1m Linhas Repetidas = $((if-ic))\E[m" "\E[31;1m Linhas LIMPAS = $((ic))\E[m")

#for aviso in "${avisos[@]}"; do
#    printf "${aviso}\n"
#done
#
# TOKEN="5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc"
# while :; do
#     echo "$1"
#     sleep 2s
#     { curl -s -F'chat_id'="739901623" -F'text'="$1" -F'parse_mode'=Markdown https://api.telegram.org/bot$TOKEN/sendMessage &>- ; echo "Deu certo!" ;} || echo "Algo deu errado!"
#     shift
#     [[ "$1" ]] && continue || break
# done
#
# fim="fim de papo"
#
# echo "${fim^^}"
