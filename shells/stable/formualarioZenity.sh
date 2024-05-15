
#!/usr/bin/env bash

arquivo="dadosRegistrados.txt"
# nomeInput="Qual seu nome"
# sobrenomeInput="Qual seu sobre nome"
# telefoneInput="Telefone"
# senhaInput="Senha"
# emailInput="Email"
# tituloCadastro="Cadastro De Funcionário"
# textoCadastro="cadastro"
novosDados=()
# tituloTipoDeEquipeLista="tipos de equipes"
# textoTipoDeEquipeLista="selecione uma das equipes para prosseguir"
# opcaoTipoDeEquipeLista=("B8 (Taguantiga Tarde)" "B9 (Cidade Jardins Tarde)" "B10 (Cidade Jardins Tarde)" "B11 (Cidade Jardins Tarde)" "B12 (Cidade Jardins Manhã)" "B13 (Cidade Jardins Manhã)" "B14 (Jardim Oriente Manhã)" "B15 (Jardim Oriente Manhã)" "B16 (Jardim Oriente Tarde)" "B17 (Jardim Oriente Tarde)" "B18 (Taguatinga Manhã)" "M3  (Contagem Tarde)" "M4  (Contagem Tarde)" "M6  (Minas Manhã)" "G1  (Goiânia Tarde)" "P2   (Calebe)" "Pos Vendas (Valparaiso))")
# #tituloPeriodoLista="tipos de equipes"
# tituloPeriodoLista="selecione um periodo"
# opcaoPeriodoLista=("manha" "tarde")
# tituloCargoLista="cargo comercial"
# textoCargoLista="Selecione um cargo"
# opcaoCargoComercialLista=("Gerente" "Supervisor" "Colaborador" "Admin Geral" "cabecaCesar")

#######################################VARIAVEIS PARA GRAVAR OS DADOS RECEBIDOS PELA ENTRADA################################
function notificarErro(){
	local nivel="critical"
	local tempo="5000"
    local cabecalho="Erro"
    local conteudo="Erro fatal ao tentar fazer a operacao"
	notify-send -u "${nivel}" -t "${tempo}" "${cabecalho}" "${conteudo}"
}

function notificarSucesso(){
	local nivel="normal"
	local tempo="5000"
    local cabecalho="Sucesso"
    local conteudo="Operação realizada com sucesso"
	notify-send -u "${nivel}" -t "${tempo}" "${cabecalho}" "${conteudo}"
}

function sair(){
        exit 1
}

function operador(){
local   tituloCadastro="cadastro de funcionário adminstrativo"
local   texto="cadastro"
local   nomeInput="nome"
local   sobrenomeInput="sobrenome"
local   email="email"
local   senhaInput="senha"
local   telefoneInput="telefone"
local   version="version live"
local   cargo="ColaboradorAdm"
local   tituloTipoDeEquipeLista="tipos de equipes"
local   textoTipoDeEquipeLista="selecione uma das equipes para prosseguir"
local   opcaoTipoDeEquipeLista=("B8 (Taguantiga Tarde)" "B9 (Cidade Jardins Tarde)" "B10 (Cidade Jardins Tarde)" "B11 (Cidade Jardins Tarde)" "B12 (Cidade Jardins Manhã)" "B13 (Cidade Jardins Manhã)" "B14 (Jardim Oriente Manhã)" "B15 (Jardim Oriente Manhã)" "B16 (Jardim Oriente Tarde)" "B17 (Jardim Oriente Tarde)" "B18 (Taguatinga Manhã)" "M3  (Contagem Tarde)" "M4  (Contagem Tarde)" "M6  (Minas Manhã)" "G1  (Goiânia Tarde)" "P2   (Calebe)" "Pos Vendas (Valparaiso))")
local   textoPeriodoLista="selecione um periodo"
local   tituloPeriodoLista="selecione um periodo"
local   opcaoPeriodoLista=("manha" "tarde")
local   tituloCargoLista="cargo comercial"
local   textoCargoLista="Selecione um cargo"
local   opcaoCargoComercialLista=("Gerente" "Supervisor" "Colaborador" "Admin Geral" "cabecaCesar")
        function receberDadosOperadorInputs(){
        dadosInputs=$(zenity --title="${tituloCadastro^^}" --text="${texto^}" --forms --add-entry="${nomeInput^}"\
                --forms --add-entry="${sobrenomeInput^}"\
                --forms --add-entry="${email^}"\
                --forms --add-password="${senhaInput^}"\
                --forms --add-entry="${telefoneInput^}"\
                --separator=',')
        }
        receberDadosOperadorInputs ###Chamando a função receberDadosInputs

        [ "$?" = "1" ] && sair
        novosDados=${dadosInputs//,/ }

        dadosTipoDeEquipe=$(zenity --list --title="${tituloTipoDeEquipeLista^^}" --text="${textoTipoDeEquipeLista^}" --column="Equipes:" "${opcaoTipoDeEquipeLista[@]}")
        [ "$?" = "1" ] && sair
        dadosPeriodo=$(zenity --list --title="${tituloPeriodoLista^^}" --text="${textoPeriodoLista^}" --column="Periodo" "${opcaoPeriodoLista[@]}")
        [ "$?" = "1" ] && sair
        dadosCargo=$(zenity --list --title="${tituloCargoLista^^}" --text="${textoCargoLista^}" --column="Cargo" "${opcaoCargoComercialLista[@]}")
        [ "$?" = "1" ] && sair

        #echo "${dadosTipoDeEquipe}"
        #echo "${dadosPeriodo}"
        #echo "${dadosCargo}"

        ###################################Retirando o delimitador virgula para o read receber como array os dadosInputs
        novosDados=${dadosInputs//,/ }
        read -a novosDados <<<"${novosDados}"
        ##########################################################################################################################
        echo "${#novosDados[@]}"

        ########################################Mandando a requisao para cadastrar no bubble######################################

        function confirmar(){
        local confirmarLista=("NOME: ${novosDados[0]}" "SOBRENOME: ${novosDados[1]}" "EMAIL: ${novosDados[2]}" "SENHA: ${novosDados[3]}" "TELEFONE: ${novosDados[4]}" "TIPO DE EQUIPE: ${dadosTipoDeEquipe}" "PERIODO: ${dadosPeriodo}" "CARAGO: ${dadosCargo}" "selecione aqui e confirme")
        local titulo="confirmar dados"
        local texto="confirme os dados"
        local detalhes="os detalhes"
        local confirmarDados="$(zenity --list --title="${titulo}" --ok-label="TUDO CERTO" --text="${texto}" --column "${detalhes}" "${confirmarLista[@]}")"
        echo "${?}"
        [ "${confirmarDados^}" != "${confirmarLista[8]^}" ] && receberDadosInputs

        }
        confirmar
        if ! curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a" "https://www.sistemaviverbemseguros.com/api/1.1/obj/User/" -d "{\"Nome\": \"${novosDados[0]} ${novosDados[1]}\",\"email\": \"${novosDados[2]}\",\"password\": \"${novosDados[3]}\",\"cargoComercial\":\"${dadosCargo}\",\"telefoneComercial\":\"${novosDados[4]}\",\"tipoDeEquipe\":\"${dadosTipoDeEquipe}\",\"periodoComercial\":\"${dadosPeriodo}\"}" 2>&- >>"${arquivo}" ; then

                notificarErro ###Chamando a função notificarErro

        else
                version="version de teste"
                curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a" "https://www.sistemaviverbemseguros.com/version-test/api/1.1/obj/User/" -d "{\"Nome\": \"${novosDados[0]} ${novosDados[1]}\",\"email\": \"${novosDados[2]}\",\"password\": \"${novosDados[3]}\",\"cargoComercial\":\"${dadosCargo}\",\"telefoneComercial\":\"${novosDados[4]}\",\"tipoDeEquipe\":\"${dadosTipoDeEquipe}\",\"periodoComercial\":\"${dadosPeriodo}\"}" 2>&- >>"${arquivo}"
                echo -e "\n${dadosInputs[0]},${dadosInputs[1]},${dadosInputs[2]}\n${version^^}">>"${arquivo}"
                echo "$?"
                notificarSucesso ###Chamando a função notificarSucesso
        fi
}

function administrativo(){
        echo "Administrativo"
local   tituloCadastro="Cadastro De Funcionário Adminstrativo"
local   texto="cadastro"
local   nomeInput="nome"
local   sobrenomeInput="sobrenome"
local   emailInput="email"
local   senhaInput="senha"
local   version="version live"
local   cargo="ColaboradorAdm"
unset dadosInputs
        function receberDadosAdministrativoInputs(){
local   dadosInputs=$(zenity --title="${tituloCadastro}" --text="${textoCadastro}" --forms --add-entry="${nomeInput^}"\
                --forms --add-entry="${sobrenomeInput^}"\
                --forms --add-entry="${emailInput^}"\
                --forms --add-password="${senhaInput^}"\
                --separator=',')
                [ -z "${dadosInputs}" ] && sair
                echo "${dadosInputs}"
                dadosInputs=${dadosInputs//,/ }
                 read -a dadosInputs <<<"${dadosInputs}"
                 if ! curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a" "https://www.sistemaviverbemseguros.com/api/1.1/obj/User/" -d "{\"Nome\": \"${dadosInputs[0]} ${dadosInputs[1]}\",\"email\": \"${dadosInputs[2]}\",\"password\": \"${dadosInputs[3]}\",\"CargosAdmin\":\"${cargo}\"}" 2>&- >>"${arquivo}"; then

                 notificarErro ###Chamando a função notificarErro

        else
                version="version de teste"
                echo "${version}"
                curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 5b2a5efbc5fda2ffff948979031ac33a" "https://www.sistemaviverbemseguros.com/version-test/api/1.1/obj/User/" -d "{\"Nome\": \"${dadosInputs[0]} ${dadosInputs[1]}\",\"email\": \"${dadosInputs[2]}\",\"password\": \"${dadosInputs[3]}\",\"CargosAdmin\":\"${cargo}\"}" 2>&- >>"${arquivo}"
                echo -e "\n${dadosInputs[0]},${dadosInputs[1]},${dadosInputs[2]}\n${version^^}">>"${arquivo}"
                echo "$?"
                notificarSucesso ###Chamando a função notificarSucesso
        fi

        }
        receberDadosAdministrativoInputs ###Chamando a função receberDadosInputs


}
function financeiro(){
        echo "Financeiro"


}

function posvendas(){
        echo "Pos Vendas"


}

function menuPrincipal(){
        local titulo="Tipo De Cadastro"
        local texto="Escolha uma para prosseguir:"
        local coluna=("Operador" "Administrativo" "Financeiro" "Pos Vendas")
        local escolherCadastro=$(zenity --list --title="${titulo}" --text="${texto}" --column "Opções" "${coluna[@]}" )
        [ "${escolherCadastro}" = "${coluna[0]}" ] && operador
        [ "${escolherCadastro}" = "${coluna[1]}" ] && administrativo
        [ "${escolherCadastro}" = "${coluna[2]}" ] && financeiro
        [ "${escolherCadastro}" = "${coluna[3]}" ] && posvendas
        [ "${?}" = "1" ] && sair
}

        menuPrincipal

        echo "${escolherCadastro}"




########################################################################################################################


