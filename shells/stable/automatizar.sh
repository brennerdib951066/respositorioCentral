#!/usr/bin/env bash

chave="no"
delay="--delay 600"
comando1=(xdotool mousemove 1530 930 click 1 key type setor.comercial.brennerdib@gmail.com)
senha="familiadib"
comando2=(xdotool mousemove 1540 270 click 1)
comando3=(xdotool mousemove 1026 400 click 1 key type roben yude)
comando4=(xdotool mousemove 1226 400 click 1 key type TenTen)
comando5=(xdotool mousemove 1426 400 click 1 key type Amadori)
comando6=(xdotool mousemove 1626 400 click 1 key)
comando7=(xdotool mousemove 1826 400 click 1 key)
comando8=(xdotool mousemove 2070 430 click 1 key type)
# sleep 1s
# xdotool mousemove 1530 965
# sleep 1s
# xdotool mousemove 1530 1000
function setarIncremento(){
    i="0"
}
function funcaoSleep(){
    sleep 0.8s
}

# function login(){
#     for ((i=0;i<3;i++)); do
#     funcaoSleep
#     [[ "$i" = "0" ]] && eval "${comando1[*]}"
#     [[ "$i" = "1" ]] && { senhaLogin=(${comando1[@]:0:8} $senha); eval "${senhaLogin[*]}" ;}
#     [[ "$i" = "2" ]] && { acessoLogin=(${comando1[@]:1:5}); eval "${comando1[*]}" ;}
#     echo "$i"
#     #echo "${comando1[*]}"
#     comando1[3]="$((comando1[3]+35))"
#     done
# }
# [[ "$chave" = "yes" ]] && login ##########Chamando a funcao login
# sleep 4s
# function cadastrarDadosPessoais(){
#     setarIncremento ##Chamando a funcao para setar o incremente
#     for ((i=0;i<14;i++)); do
#     funcaoSleep
#     [[ "$i" = "0" ]] && eval "${comando2[*]}"
#     [[ "$i" = "1" ]] && eval "${comando3[*]}"
#     [[ "$i" = "2" ]] && { rFinanceiro=(${comando3[*]:0:8}) ; eval ${rFinanceiro[*]} "Azu" ;}
#     [[ "$i" = "3" ]] && { profissao=(${comando3[*]:0:8}) ; eval ${profissao[*]} "Cantor" ;}
#     [[ "$i" = "4" ]] && { email=(${comando3[*]:0:8}) ; eval ${email[*]} "roby@gmail.com" ;}
#     [[ "$i" = "5" ]] && { altura=(${comando3[*]:0:8}) ; eval ${altura[*]} "1,63" ;}
#     [[ "$i" = "6" ]] && { peso=(${comando3[*]:0:8}) ; eval ${peso[*]} "52,70" ;}
#     [[ "$i" = "7" ]] && { documento=(${comando3[*]:0:7}) ; eval ${documento[*]} "$delay" Down Down Return;}
#     [[ "$i" = "8" ]] && { nDocumento=(${comando3[*]:0:8}) ; eval ${nDocumento[*]} "607080906325" ;}
#     [[ "$i" = "9" ]] && { idade=(${comando3[*]:0:8}) ; eval ${idade[*]} "25" ;}
#     [[ "$i" = "10" ]] && { sexo=(${comando3[*]:0:7}) ; eval ${sexo[*]} "$delay" Down Down Return;}
#      [[ "$i" = "11" ]] && { estadoCivil=(${comando3[*]:0:7}) ; eval ${estadoCivil[*]} "$delay" Down Down Return;}
#      [[ "$i" = "12" ]] && { telefone=(${comando3[*]:0:8}) ; eval ${telefone[*]} "5561998304056" ;}
#      [[ "$i" = "13" ]] && { escolaridade=(${comando3[*]:0:7}) ; eval ${escolaridade[*]} "$delay" Down Down Down Return;}
#     ((i>0)) && comando3[3]="$((comando3[3]+35))"
#     done
#
# }
# cadastrarDadosPessoais ##Chamando a funcao cadastrarDadosPessoais####
# setarIncremento ##Chamando a funcao para setar o incremente
#
# function cadastrarPlanos(){
#
#     for ((i=0;i<9;i++)); do
#     funcaoSleep
#     [[ "$i" = "0" ]] && { echo "I INCREMENTE $i"; eval "${comando4[*]}" ;}
#     [[ "$i" = "1" ]] && { pDependentes=(${comando4[*]:0:7}) ; eval ${pDependentes[*]} "$delay" Down Down Down Return ;}
#     [[ "$i" = "2" ]] && { pCompraDeCarencia=(${comando4[*]:0:7}) ; eval ${pCompraDeCarencia[*]} "$delay" Down Down Down Return ;}
#     [[ "$i" = "3" ]] && { qtdsVidas=(${comando4[*]:0:8}) ; eval ${qtdsVidas[*]} 25 ;}
#     [[ "$i" = "4" ]] && { vigencia=(${comando4[*]:0:7}) ; eval ${vigencia[*]} "$delay" Down Down Down Down Return ;}
#     [[ "$i" = "5" ]] && { qAcomodacao=(${comando4[*]:0:7}) ; eval ${qAcomodacao[*]} "$delay" Down Down Down Return ;}
#     [[ "$i" = "6" ]] && { qComparticipacao=(${comando4[*]:0:7}) ; eval ${qComparticipacao[*]} "$delay" Down Down Down Return ;}
#     [[ "$i" = "7" ]] && { valorDoPlano=(${comando4[*]:0:8}) ; eval ${valorDoPlano[*]} 3021,56 ;}
#     [[ "$i" = "8" ]] && { valorDaAdesao=(${comando4[*]:0:8}) ; eval ${valorDaAdesao[*]} 2000 ;}
#     comando4[3]="$((comando4[3]+35))"
#     done
# }
# cadastrarPlanos ##Chamdno a funcao cadastrarPlanos
# setarIncremento ##Chamando a funcao para setar o incremente
#
# function cadastrarOperadora(){
#
#     for ((i=0;i<8;i++)); do
#     funcaoSleep
#     [[ "$i" = "0" ]] && { echo "I INCREMENTE $i"; operadora=${comando5[*]:0:7} ; eval "${operadora[*]}" "$delay" Down Down Return ;}
#     [[ "$i" = "1" ]] && { qEntidade=(${comando5[*]}) ; eval ${qEntidade[*]}  ;}
#     [[ "$i" = "2" ]] && { administradora=(${comando5[*]:0:7}) ; eval ${administradora[*]} "$delay" Down Down Down Return ;}
#     [[ "$i" = "3" ]] && { vencimentoDosBoletos=(${comando5[*]:0:7}) ; eval ${vencimentoDosBoletos[*]} "$delay" Down Down Down Left Return ;}
#     [[ "$i" = "4" ]] && { vencimentoDaAdesao=(${comando5[*]:0:7}) ; eval ${vencimentoDaAdesao[*]} "$delay" Down Down Down Left Return ;}
#     [[ "$i" = "5" ]] && { dataDaVenda=(${comando5[*]:0:7}) ; eval ${dataDaVenda[*]} "$delay" Down Down Down Down Right Return ;}
#     [[ "$i" = "6" ]] && { mesDaVenda=(${comando5[*]:0:7}) ; eval ${mesDaVenda[*]} "$delay" Down Down Down Down Return ;}
#     [[ "$i" = "7" ]] && { statusDaVenda=(${comando5[*]:0:7}) ; eval ${statusDaVenda[*]} "$delay" Down Down Return ;}
#     comando5[3]="$((comando5[3]+35))"
#     done
# }
# cadastrarOperadora
setarIncremento ##Chamando a funcao para setar o incremente

# function cadastrarLogradouro(){
#
#     for ((i=0;i<3;i++)); do
#     funcaoSleep
#     [[ "$i" = "0" ]] && { echo "I INCREMENTE $i"; logradouro=${comando6[*]} ; eval "${logradouro[*]}" "$delay" Down Down Down Down Down Down Down Down Down Return ;}
#     [[ "$i" = "1" ]] && { abrangenciaDoPlano=(${comando6[*]}) ; eval ${abrangenciaDoPlano[*]} "$delay" Down Down Return ;}
#     comando6[3]="$((comando6[3]+35))"
#     done
# }
# cadastrarLogradouro

# function cadastrarOutrosDados(){
#
#     for ((i=0;i<4;i++)); do
#     funcaoSleep
#     [[ "$i" = "0" ]] && { echo "I INCREMENTE $i"; sala=${comando7[*]} ; eval "${sala[*]}" "$delay" Down Down Return ;}
#     [[ "$i" = "1" ]] && { gerentes=(${comando7[*]}) ; eval ${gerentes[*]} "$delay" Down Down Return ;}
#     [[ "$i" = "2" ]] && { echo "I INCREMENTE $i"; supervisores=${comando7[*]} ; eval "${supervisores[*]}" "$delay" Down Down Return ;}
#     [[ "$i" = "3" ]] && { tipoDeVenda=(${comando7[*]}) ; eval ${tipoDeVenda[*]} "$delay" Down Down Return ;}
#     comando7[3]="$((comando7[3]+35))"
#     done
# }
# cadastrarOutrosDados
setarIncremento

function cadastrarDocumentacao(){

    for ((i=0;i<4;i++)); do
    funcaoSleep
#     [[ "$i" = "0" ]] && { echo "I INCREMENTE $i"; documentacao=${comando8[*]:0:5} ; eval "${documentacao[*]}" ;}
#     [[ "$i" = "1" ]] && { caminho=(${comando8[*]}) ; eval ${caminho[*]} "$delay" "/$HOME/Downloads/hiro.jpeg"; eval "${comando8[0]} key Return"  ;}
    [[ "$i" = "3" ]] && { echo "I INCREMENTE $i"; enviarTudo=${comando8[*]:0:6} ; eval "${enviarTudo[*]}" ;}
    (("$i"<"3")) && comando8[3]="$((comando8[3]+35))"\
    || comando8[3]="610"
    done
}
cadastrarDocumentacao
