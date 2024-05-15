#!/usr/bin/env bash


metodos=('criar' 'atualizar' 'deletar')
dados=("nome" "possuiMaisTitulares" "maisTitularesDoPlano" "responsavelFinanceiro" "profissao" "email" "altura" "peso" "documento" "numeroDocumento" "idade" "sexo" "estadoCivil" "telefone" "escolaridade" "tipoCliente" "nomeDoPlano" "possuiDependentes" "descricaoDependentes" "possuiCarencia" "qtdsVidas" "vigencia" "acomodacao" "comparticipacao" "valorDoPlano" "valorDaAdesao" "operadora" "entidade" "nomeDaAdmistradora" "vencimentoDosBoletos" "vencimentoDaAdesao" "dataDaVenda" "mesDaVenda" "statusDaVenda" "logradouro" "abrangenciaDoPlano" "sala" "gerentes" "supervisor" "tipoDeVenda" "nomeVendedor" "statusAdministrativo" "statusFinanceiro" "delete")

#__________________________________________________________________________ Funções_________________________________________________________

criarPlanilha(){


    i=1
    for dado in "${dados[@]}"; do
        echo -e "\E[31;1mIncremente = ${i}\E[m"
        until false; do
            read -p "${dado}:   " dado[i]
            [[ -z "${dado[i]}" ]] || { ((i++)); break ;}

        done
    done
    # Criando a planilha com os dados fornecido pelo usuário
    { echo -e "cadastrando na planilha!!!!" ; sleep 1s; }
    curl -X POST -H'Content-Type: application/json' -d"{ \"somentetestis\": {

            \"nome\": \"${dado[1]}\",
            \"possuiMaisTitulares\": \"${dado[2]}\",
            \"maisTitularesDoPlano\": \"${dado[3]}\",
            \"responsavelFinanceiro\": \"${dado[4]}\",
            \"profissao\": \"${dado[5]}\",
            \"email\": \"${dado[6]}\",
            \"altura\": \"${dado[7]}\",
            \"peso\": \"${dado[8]}\",
            \"documento\": \"${dado[9]}\",
            \"numeroDocumento\": \"${dado[10]}\",
            \"idade\": \"${dado[11]}\",
            \"sexo\": \"${dado[12]}\",
            \"estadoCivil\": \"${dado[13]}\",
            \"telefone\": \"${dado[14]}\",
            \"escolaridade\": \"${dado[15]}\",
            \"tipoCliente\": \"${dado[16]}\",
            \"nomeDoPlano\": \"${dado[17]}\",
            \"possuiDependentes\": \"${dado[18]}\",
            \"descricaoDependentes\": \"${dado[19]}\",
            \"possuiCarencia\": \"${dado[20]}\",
            \"qtdsVidas\": \"${dado[21]}\",
            \"vigencia\": \"${dado[22]}\",
            \"acomodacao\": \"${dado[23]}\",
            \"comparticipacao\": \"${dado[24]}\",
            \"valorDoPlano\": \"${dado[25]}\",
            \"valorDaAdesao\": \"${dado[26]}\",
            \"operadora\": \"${dado[27]}\",
            \"entidade\": \"${dado[28]}\",
            \"nomeDaAdmistradora\": \"${dado[29]}\",
            \"vencimentoDosBoletos\": \"${dado[30]}\",
            \"vencimentoDaAdesao\": \"${dado[31]}\",
            \"dataDaVenda\": \"${dado[32]}\",
            \"mesDaVenda\": \"${dado[33]}\",
            \"statusDaVenda\": \"${dado[34]}\",
            \"logradouro\": \"${dado[35]}\",
            \"abrangenciaDoPlano\": \"${dado[36]}\",
            \"sala\": \"${dado[37]}\",
            \"gerentes\": \"${dado[38]}\",
            \"supervisor\": \"${dado[39]}\",
            \"tipoDeVenda\": \"${dado[40]}\",
            \"nomeVendedor\": \"${dado[41]}\",
            \"statusAdministrativo\": \"${dado[42]}\",
            \"statusFinanceiro\": \"${dado[43]}\",
            \"delete\": \"${dado[44]}\"

    }
}" "https://api.sheety.co/2bbc21da49ca3449a8fb7d7c6afe1b6c/testes/somenteTestes"

}

atualizarPlanilha(){

    adicionandoAtualizacao(){
            until false; do
                echo -e "\E[31;1mAltere ${1}\E[m:   "
                read atualizarDado
                [[ -z "${atualizarDado}" ]] || break
            done

            until false; do
                echo -e "\E[31;1mDigite o numero da linha\E[m:   "
                read numeroLinha
                [[ -z "${numeroLinha}" ]] || break
            done


    curl -X PUT -H'Content-Type: application/json' -d"{ \"somentetestis\": {

            \"${1}\": \"${atualizarDado}\"

    }

        }" "https://api.sheety.co/2bbc21da49ca3449a8fb7d7c6afe1b6c/testes/somenteTestes/${numeroLinha}"
} # Função atualizar dados



echo "ATUALIZARRRR"
PS3=$'\nQual desse deseja atualizar:   '
select menu in "${dados[@]}"; do
        case $REPLY in
         1) { echo -e "\E[45;1mVocê escolheu ${dados[0]^^}\E[m"; adicionandoAtualizacao "${dados[0]}"; break ;}
         ;;

         2) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[1]}"; break ;}
         ;;

         3) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[2]}"; break ;}
         ;;

         4) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[3]}"; break ;}
         ;;

         5) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[4]}"; break ;}
         ;;

         6) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[5]}"; break ;}
         ;;

         7) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[6]}"; break ;}
         ;;

         8) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[7]}"; break ;}
         ;;

         9) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[8]}"; break ;}
         ;;

         10) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[9]}"; break ;}
         ;;

         11) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[10]}"; break ;}
         ;;

         12) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[11]}"; break ;}
         ;;

         13) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[12]}"; break ;}
         ;;

         14) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[13]}"; break ;}
         ;;

         15) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[14]}"; break ;}
         ;;

         16) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[15]}"; break ;}
         ;;

         17) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[16]}"; break ;}
         ;;

         18) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[17]}"; break ;}
         ;;

         19) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[18]}"; break ;}
         ;;

         20) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[19]}"; break ;}
         ;;

         21) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[20]}"; break ;}
         ;;

         22) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[21]}"; break ;}
         ;;

         23) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[22]}"; break ;}
         ;;

         24) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[23]}"; break ;}
         ;;

         25) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[24]}"; break ;}
         ;;

         26) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[25]}"; break ;}
         ;;

         27) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[26]}"; break ;}
         ;;

         28) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[27]}"; break ;}
         ;;

         29) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[28]}"; break ;}
         ;;

         30) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[29]}"; break ;}
         ;;

         31) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[30]}"; break ;}
         ;;

         32) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[31]}"; break ;}
         ;;

         33) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[32]}"; break ;}
         ;;

         34) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[33]}"; break ;}
         ;;

         35) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[34]}"; break ;}
         ;;

         36) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[35]}"; break ;}
         ;;

         37) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[36]}"; break ;}
         ;;

         38) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[37]}"; break ;}
         ;;

         39) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[38]}"; break ;}
         ;;

         40) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[39]}"; break ;}
         ;;

         41) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[40]}"; break ;}
         ;;

         42) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[41]}"; break ;}
         ;;

         43) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[42]}"; break ;}
         ;;

         44) { echo -e "\E[45;1mVocê escolheu ${dados[1]^^}\E[m"; adicionandoAtualizacao "${dados[43]}"; break ;}
         ;;


         *) echo "Nao existe nada aqui"
        esac

done
}

deletarPlanilha(){
    until false; do
        read -p $'\E[31;1mLinha á deletar:\E[m' linhaAdeletar
        [[ -z "${linhaAdeletar}" ]] || break
    done

    curl -X DELETE -H'Content-Type: application/json' "https://api.sheety.co/2bbc21da49ca3449a8fb7d7c6afe1b6c/testes/somenteTestes/${linhaAdeletar}"

}

#____________________________________________________________________________________________________________________________________________
PS3=$'\n\E[37;1mQual método deseja utilizar?\E[m   '
select menu in "${metodos[@]}"; do
    case $REPLY in
        1) echo -e "\E[45;1mVocê escolheu ${metodos[0]^^}\E[m"; criarPlanilha; break
        ;;

        2) echo -e "\E[45;1mVocê escolheu ${metodos[1]^^}\E[m"; atualizarPlanilha; break
        ;;

        3) echo -e "\E[45;1mVocê escolheu ${metodos[2]^^}\E[m"; deletarPlanilha; break
        ;;

        *) { echo -e "\E[41;2mNão existe essa opção\E[m" ; sleep 2s ; exit 1 ;}

    esac

done
