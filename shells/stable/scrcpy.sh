#!/usr/bin/env bash
# Version 1.0.0.0.0

# comando pra iniciar O sicronismo Entre o Celular e o PC 
############################Variaveis do programa###########################################
sansungIp="192.168.0.4:5555"
philcoIp="192.168.0.3:5555"
buracoNegro="/dev/null"
PS3="Escolha o celular pra conectar "
lista=("Sansung" "Philco" "HTOP")


verificacao=$(adb devices -l | grep -iEo '[0-9]{3}.[0-9]{3}.[0-9]+.[0-9]+[:][0-9]{4}')
ajuda="bibliotecas/helpScrcpy.txt"
############################################################################################
#############################Verificando o usuário da maquina################################
(($UID==0)) && { echo "OpaH root não" ; exit 1 ;}

function conectar(){
      philcoIp="192.168.0.6:5555"
      function conectando(){
        adb disconnect "${philcoIp}" &>-
        adb tcpip 5555 &>-
        adb connect ${philcoIp} &>-
        scrcpy 2>"${buracoNegro}" >"${buracoNegro}" &
      }
      if [ "${1}" ]; then               ############Verificando se o primeiro parametro esta vazio
          case $1 in
                "-desconectar") { adb disconnect "${philcoIp}" &>-; exit 0 ;}     ;;
                "-conectar")     { conectando ${@} ;}                             ;;
                -h|--help) echo "Você chamou a ajuda"                            ;;
                *) { echo $'\E[37;1mFaltou opção Ou opção não existente\E[m'; exit 1 ;}
          esac
      else
          printf '%s\n'  "$(< ${ajuda})" ####Caso o parametro esteja vazio irá chamar o arquivo de ajuda

      fi
}
[ "$USER" = "brenner" ] && { conectar $@ ; }

#############################################################################################

function connectDenner(){
[[ "${verificacao}" = "${sansungIp}" ]] && adb disconnect "${sansungIp}" || adb disconnect "${philcoIp}"

select menu in ${lista[@]}; do  
  case $REPLY in 
  
     # adb tcpip 5555 : Comando pra Restart   na porta 5555
     1) { adb tcpip 5555  ; adb connect 192.168.0.4:5555; 						   
      	 echo "Atenção O celular que Esta conectado Na IP 192.168.0.4:5555 samsung " ; 
      break  ;};; 
     2) { adb tcpip 5555 ; adb connect 192.168.0.3:5555; 
    	 echo "Atenção O celular que Esta conectado Na IP 192.168.0.4:5555 samsung " ;
    	 
      break  ;};;
     3) { htop ;};;   
  
  esac 

done  

# start Pra inicar o Celular Espelhado

scrcpy 2>"${buracoNegro}" >"${buracoNegro}"
exit 1

}
[ "$USER" = "denner" ] && connectDenner
