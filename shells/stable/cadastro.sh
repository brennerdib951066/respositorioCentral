#!/usr/bin/env bash

#########################HEAD#############################################################

# Autor    : Brenner Santos
# Data     : 08/11/2023
# version  : 1.0.0.0.0
# Programa : Criado com objetivo de fazer cadastros da viver bem via api pelo metodo CURL

######################################################################################################
####################VARIAVEIS COMUNS DO PROGRAMA######################################################
arquivo="bubblinho.txt"
corVermelho="\E[31;1m"
fecharCor="\E[m"
arquivo="viverBem.txt"
######################################################################################################
####################VARIAVEIS ESPECIAIS DO PROGRAMA###################################################



######################################################################################################

####################VERIFICAÇÕES######################################################################
((UID==0)) && { printf "${corVermelho}Não pode Root!\n${fecharCor}"; exit 1 ;}
login(){
local titulo="login"
local texto="acesso :"
    credenciais=$( zenity --timeout="10" --title="${titulo^}" --text="${texto^^}" --forms --add-entry="Nome"\
    --forms --add-password="Senha"\
    --separator=','
)
[[ "${credenciais}" =~ ^, && ${?} -eq 0 ]] && login ||\
[[ "${credenciais%,*}" = "${nome}" && "${credenciais#*,}" = "${senha}" ]] || login # Chando a função pois algo deu errado
}
login ### Chamando a função para iniciar a interação com o usuario
####################################################################################################

enviar(){
    for ((i=0;i<2;i++)) ; do
    versao="version-test"
    ((i==1)) && versao="version-live"
    case ${escolherFuncao} in
       OPERADOR) curl -X POST -H'content-type: application/json' -H'Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a'  -d "{\"Nome\": \"${receberDados[0]}\",\"telefoneComercial\": \"${novosDados[1]}\",\"email\": \"${receberDados[2]}\",\"password\":\"${receberDados[3]}\",\"tipoDeEquipe\": \"${entradaTipoDeEquipe}\",\"cargoComercial\":\"${entradaCargo}\",\"periodoComercial\": \"${listaPeriodo}\"}" "https://www.sistemaviverbemseguros.com/${versao}/api/1.1/obj/User/" 2>&- >>"${arquivo}"; cat >> ${arquivo}<<EOF
        Nome: ${receberDados[0]}
         Email: ${receberDados[2]}
        ${versao}
#####################################################################################################
EOF
;;
    ADMINISTRATIVO) curl -X POST -H'content-type: application/json' -H'Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a'  -d "{\"Nome\": \"${receberDados[0]}\",\"telefoneComercial\": \"${novosDados[1]}\",\"email\": \"${receberDados[2]}\",\"password\":\"${receberDados[3]}\",\"CargosAdmin\": \"${cargo}\"}" "https://www.sistemaviverbemseguros.com/${versao}/api/1.1/obj/User/" 2>&- >>"${arquivo}"; cat >> ${arquivo}<<EOF
        Nome: ${receberDados[0]}
         Email: ${receberDados[2]}
        ${versao}
#####################################################################################################
EOF
;;
    FINANCEIRO) curl -X POST -H'content-type: application/json' -H'Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a'  -d "{\"Nome\": \"${receberDados[0]}\",\"telefoneComercial\": \"${novosDados[1]}\",\"email\": \"${receberDados[2]}\",\"password\":\"${receberDados[3]}\",\"cargosFin\": \"${cargo}\"}" "https://www.sistemaviverbemseguros.com/${versao}/api/1.1/obj/User/" 2>&- >>"${arquivo}"; cat >> ${arquivo}<<EOF
        Nome: ${receberDados[0]}
         Email: ${receberDados[2]}
        ${versao}
#####################################################################################################
EOF
;;
    * ) printf "Não faço nada assim"
    esac


    done
    kate ${arquivo}
} ### FUNCAO ENVIAR DADOS############################################################################

  ### FUNÇÂO CORTAR DADOS############################################################################
cortar(){
    r=0
    for ((i=1;i<5;i++)); do
    dadosProntos=$(cut -d',' -f"${i}" <<<"${entrada}")
    read receberDados[$r]<<<"${dadosProntos}"
    ((r++))
    printf "${receberDados[1]}\n"

done # LOOP FOR PARA RECER E CORTAR COM O CUT OS DADOS RECEBIDOS
enviar receberDados[@]
}

  ##################################################################################################

##################OPERADOR###########################################################################
operador(){
    printf 'Chamou operador!\n'
       local titulo="Cadastro" texto="Escolha Uma das Opções" nomeEntrada="Nome" telefone="telefone" email="email" senhaEntrada="senha"
local  entrada=$( zenity --title="${titulo^^}" --text="${texto}" --forms --add-entry="${nomeEntrada^^}"\
                  --forms --add-entry="${telefone^^}" --forms --add-entry="${email^^}"\
                  --forms --add-entry="${senhaEntrada^^}"\
                  --separator=","
)
printf "${corVermelho}${entrada%%,*}${fecharCor}\n"
printf "${corVermelho}${entrada#*,}${fecharCor}\n"

########################CHAMANDO A LISTA DE EQUIPES###################################################
declare -A equipes

equipes[titulo]="escolha uma equipe"
equipes[texto]="equipes:"

local   listaEquipe=("B8 (Taguantiga Tarde)" "B9 (Cidade Jardins Tarde)" "B10 (Cidade Jardins Tarde)" "B11 (Cidade Jardins Tarde)" "B12 (Cidade Jardins Manhã)" "B13 (Cidade Jardins Manhã)" "B14 (Jardim Oriente Manhã)" "B15 (Jardim Oriente Manhã)" "B16 (Jardim Oriente Tarde)" "B17 (Jardim Oriente Tarde)" "B18 (Taguatinga Manhã)" "M3  (Contagem Tarde)" "M4  (Contagem Tarde)" "M6  (Minas Manhã)" "G1  (Goiânia Tarde)" "P2   (Calebe)" "Pos Vendas (Valparaiso))")
local   entradaTipoDeEquipe=$( zenity --list --title="${equipes[titulo]}" --text="${equipes[texto]}" --column "Salas" "${listaEquipe[@]}"
)

declare -A cargo

cargo[titulo]="escolha um cargo"
cargo[texto]="cargos:"
listaCargo=("Gerente" "Supervisor" "Colaborador" "Admin Geral" "cabecaCesar")
local   entradaCargo=$( zenity --list --title="${cargo[titulo]}" --text="${cargo[texto]}" --column "Função" "${listaCargo[@]}"
)

declare -A periodo

periodo[titulo]="escolha um período"
periodo[texto]="período"
listaPeriodo=("manha" "tarde")
local   entradaPeriodo=$( zenity --list --title="${periodo[titulo]}" --text="${periodo[texto]}" --column "Período" "${listaPeriodo[@]}"
)
cortar # entradaCargo[@] ### Chamando a função de enviar dados para o bubble

###########################################################################################################
}

############################ADMINISTRATIVO#################################################################
administrativo(){
    printf 'Chamou administrativo!\n'
    local titulo="cadastro" texto="Escolha Uma Das Opções" nomeEntrada="nome" telefone="telefone" email="email" senhaEntrada="senha"
    local entrada=$( zenity --title="${titulo^^}" --text="${texto}" --forms --add-entry="${nomeEntrada^^}"\
                    --forms --add-entry="${telefone^^}"\
                    --forms --add-entry="${email^^}"\
                    --forms --add-entry="${senhaEntrada^^}"\
                    --separator=','
)
printf "ENTRADA administrativo ${entrada}"
#cortar

declare -A admin
admin=([cargo1]="GerenteGeralAdm" [cargo2]="SupervisorAdm" [cargo3]="ColaboradorAdm")
    local cargo=$( zenity --list --title="${titulo}" --text="${texto}" --column "Cargo" "${admin[cargo1]}" "${admin[cargo2]}" "${admin[cargo3]}"
)
cortar

}
###########################################FIM ADMINISTRATIVO###################################################


############################################FINANCEIRO##########################################################
financeiro(){
    printf "CHAMOU O FINANCEIRO!\n"
    local titulo="cadastro" texto="Escolha alguma das opções" nomeEntrada="nome" telefone="telefone" email="email" senhaEntrada="senha"
    local entrada=$( zenity --title="${titulo}" --text="${texto}"\
                    --forms --add-entry="${nomeEntrada^^}"\
                    --forms --add-entry="${telefone^^}"\
                    --forms --add-entry="${email^^}"\
                    --forms --add-entry="${senhaEntrada^^}"\
                    --separator=","
)
printf "${entrada}\n"
declare -A finan
finan=([cargo1]="GerenteGeralFin" [cargo2]="SupervisorFin" [cargo3]="ColaboradorFin")
    local cargo=$( zenity --list --title="${titulo}" --text="${texto}" --column "Cargo" "${finan[cargo1]}" "${finan[cargo2]}" "${finan[cargo3]}"
)
printf "${cargo}\n"
cortar
}


#############################################FIM FINANCEIRO#####################################################

###############################CHAMANDO TODAS AS FUNÇÔES########################################################
listaInicial=("operador" "administrativo" "financeiro" "pos vendas")
titulo="Cadastro"
texto="Escolha Uma das Opções"
escolherFuncao=$(zenity --list --title="${titulo^^}" --text="${texto}" --column "Opções :" "${listaInicial[@]^^}"
)

[ "${escolherFuncao}" = "${listaInicial[0]^^}" ] && operador
[ "${escolherFuncao}" = "${listaInicial[1]^^}" ] && administrativo
[ "${escolherFuncao}" = "${listaInicial[2]^^}" ] && financeiro
#printf "${escolherFuncao}\n"

