#!/usr/bin/env bash
####IMPORTANTE##############
# Feito para telas Ultrawide com zoom em 67%. Tela dividida em 50%
############################

######Variaveis globais#####################################
comandoXdotoll="xdotool"
mover="mousemove"
clicar="click 1"
enviarKey="key type"
enviarCredenciais=("setor.comercial.brennerdib@gmail.com" "familiadib")
enviarCadastroDadosPessoias=("Akeboshi Teste Periodico" "Takashi Suzakage" "Cantor" "akeboshi@gmail.com" "1,65" "54,34" "CPF" "85902335418589" "26" "Sexo" "Estado Civil" "5561998989596" "Escolaridade")
enviarCadastroPlano=("Sayonara Bye Bye" "Possui Dependentes" "Possui Carencia" "50" "Vigencia" "Qual Acomodacao" "Qual Comparticipacao" "3250" "7560")
enviarCadastroOperadora=("Kamisamah" "Hodo" "Possui Carencia" "50" "Vigencia" "Qual Acomodacao" "Qual Comparticipacao" "3250" "7560")
enviarCadastroLogradouro=("Goias" "Nacional")
enviarCadastroOutroDados=("B14" "Lais" "Gabi" "online")
enviarCadastroFoto="/home/brenner/Downloads/hiro.jpeg"

function armazenarVariaveis(){
posicaoLogin=("1440" "930")
posicaoEtiqueta=("1550" "275")
posicaoDadosPessoaisEntrada=("1010" "405")
posicaoPlanoEntrada=("1200" "400")
posicaoOperadoraEntrada=("1410" "400")
posicaoLagradouroEntrada=("1610" "400")
posicaoOutrosDadosEntrada=("1860" "400")
posicaoFotoEntrada=("2085" "430")
posicaoCadastrarEntrada=("2080" "610")
abriCorVermelho="\E[31;1m"
fecharCor="\E[m"
############################################################
}
armazenarVariaveis
i=0
f=0
#until [[ "$f" = "2" ]]; do

function cadastroDeEtiquetas(){

function logar(){
    for credenciais in "${enviarCredenciais[@]}"; do
        read posicaoAtual[$i]<<<"$posicaoLogin"
        echo "$posicaoAtual"
        sleep 2s
    #     echo "CREDE ${credenciais}"
        eval "${comandoXdotoll}" "${mover}" "${posicaoLogin[0]}" "${posicaoLogin[1]}" "${clicar}" "${enviarKey}" "${credenciais}"
        posicaoLogin[1]="$((posicaoLogin[1]+30))"
        ((i++))
    done ###LOGIN
}
logar ############################Chamando a função logar
    eval "${comandoXdotoll}" "${mover}" "${posicaoLogin[0]}" "${posicaoLogin[1]}" "${clicar}" ##Clicando no botão de Login

    sleep 5s
    eval "${comandoXdotoll}" "${mover}" "${posicaoEtiqueta[0]}" "${posicaoEtiqueta[1]}" "${clicar}"
    i=0
function cadastrarDadosPessoais(){
    for dadosPessoiasEntrada in "${enviarCadastroDadosPessoias[@]}"; do
        #sleep 3s
        ((i++))
        [[ "$i" = "7" || "$i" = "10" || "$i" = "11" || "$i" = "13" ]] && { enviarKey="key --delay 400 Down Down Return"; dadosPessoiasEntrada= ;} || { enviarKey="key type" ;}
        read posicaoAtual[$i]<<<"$posicaoLogin"
        eval "${comandoXdotoll}" "${mover}" "${posicaoDadosPessoaisEntrada[0]}" "${posicaoDadosPessoaisEntrada[1]}" "${clicar}" "${enviarKey}" "${dadosPessoiasEntrada}"
        posicaoDadosPessoaisEntrada[1]="$((posicaoDadosPessoaisEntrada[1]+33))"


    done ## DADOS PESSOAIS
}
cadastrarDadosPessoais
    function setarI(){
        i=0
    }
    setarI
function cadastrarPlanos(){
    for planoEntrada in "${enviarCadastroPlano[@]}"; do
        #sleep 3s
        ((i++))
        [[ "$i" = "2" || "$i" = "3" || "$i" = "5" || "$i" = "6" || "$i" = "7" ]] && { enviarKey="key --delay 400 Down Down Down Return"; planoEntrada= ;} || { enviarKey="key type" ;}
        read posicaoAtual[$i]<<<"$posicaoLogin"
        eval "${comandoXdotoll}" "${mover}" "${posicaoPlanoEntrada[0]}" "${posicaoPlanoEntrada[1]}" "${clicar}" "${enviarKey}" "${planoEntrada}"
        posicaoPlanoEntrada[1]="$((posicaoPlanoEntrada[1]+35))"


    done ## Plano
}
cadastrarPlanos ############################Chamando a funçao cadastrarPlanos
    setarI

function cadastrarOperadora(){
    for operadoraEntrada in "${enviarCadastroOperadora[@]}"; do
        #sleep 3s
        ((i++))
        [[ "$i" = "1" || "$i" = "3" || "$i" = "4" || "$i" = "5" || "$i" = "6" || "$i" = "7" || "$i" = "8" ]] && { enviarKey="key --delay 400 Down Down Down Return"; operadoraEntrada= ;} || { enviarKey="key type" ;}
        read posicaoAtual[$i]<<<"$posicaoLogin"
        eval "${comandoXdotoll}" "${mover}" "${posicaoOperadoraEntrada[0]}" "${posicaoOperadoraEntrada[1]}" "${clicar}" "${enviarKey}" "${operadoraEntrada}"
        posicaoOperadoraEntrada[1]="$((posicaoOperadoraEntrada[1]+35))"


    done ## Operadora
}
cadastrarOperadora #########################Chamando a funçao cadastrarOperadora
    setarI

function cadastrarLogradouro(){
    for logradouroEntrada in "${enviarCadastroLogradouro[@]}"; do
        #sleep 3s
        ((i++))
        [[ "$i" = "1" || "$i" = "2" ]] && { enviarKey="key --delay 400 Down Down Return"; operadoraEntrada= ;} || { enviarKey="key type" ;}
        read posicaoAtual[$i]<<<"$posicaoLogin"
        eval "${comandoXdotoll}" "${mover}" "${posicaoLagradouroEntrada[0]}" "${posicaoLagradouroEntrada[1]}" "${clicar}" "${enviarKey}" "${logradouroEntrada}"
        posicaoLagradouroEntrada[1]="$((posicaoLagradouroEntrada[1]+35))"


    done ## Logradouro
}
cadastrarLogradouro ############################Chamando a funçao cadastrarLogradouros
    setarI

function cadastrarOutrosDados(){
    for outrosDadosEntrada in "${enviarCadastroOutroDados[@]}"; do
        #sleep 3s
        ((i++))
        [[ "$i" = "1" || "$i" = "2" || "$i" = "3" || "$i" = "4" ]] && { enviarKey="key --delay 400 Down Down Down Down Down Down Return"; outrosDadosEntrada= ;} || { enviarKey="key type" ;}
        read posicaoAtual[$i]<<<"$posicaoLogin"
        eval "${comandoXdotoll}" "${mover}" "${posicaoOutrosDadosEntrada[0]}" "${posicaoOutrosDadosEntrada[1]}" "${clicar}" "${enviarKey}" "${outrosDadosEntrada}"
        posicaoOutrosDadosEntrada[1]="$((posicaoOutrosDadosEntrada[1]+35))"


    done ## Outros Dados
}
cadastrarOutrosDados ############################Chamando a funçao cadastrarDados

    setarI
function salvarFotos(){
    { eval "$comandoXdotoll" "${mover}" "${posicaoFotoEntrada[0]}" "${posicaoFotoEntrada[1]}" "${enviarKey%% *}" "${clicar}"; sleep 1s ; eval "$comandoXdotoll"  "${enviarKey}" "${enviarCadastroFoto}"; eval "$comandoXdotoll" "${enviarKey%% *}" "Return" ;}

    { sleep 5s; eval "${comandoXdotoll}" "${mover}" "${posicaoCadastrarEntrada[0]}" "${posicaoCadastrarEntrada[1]}" "${clicar}" ;}
}
salvarFotos

} ############################FIM DA FUNÇÃO PRINCIPAL

#[[ "$f" = "2" ]] && { ${enviarCadastroDadosPessoias[0]}="Anly";${enviarCadastroDadosPessoias[7]}="814567897456" ;}
# ((f++))
sleep 2s
cadastroDeEtiquetas
#done #######Until

