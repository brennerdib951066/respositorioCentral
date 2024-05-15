#!/usr/bin/env bash

											  # HEAD
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################

								# VARIAVEIS DO PROGRAMA
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################

					# VARIAVEIS ESPECIAIS DO PROGRAMA
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################

										# VERIFICAÇÕES
##########################################################
#                                                        #
#                                                        #
#                                                        #
##########################################################

trabalho(){
						url="https://bubble.io/page?type=page&name=setor_administrativo&id=viverbemseguroscrm&tab=tabs-1 https://bubble.io/page?type=page&name=setor_administrativo&id=viverbemseguroscrm&tab=tabs-3&subtab=Data+Types&type_id=user https://www.sistemaviverbemseguros.com/version-test https://web.whatsapp.com/"
#						subscriber="213289248"
						urlBot="https://backend.botconversa.com.br/api/v1/webhook/subscriber/$subscriber/send_message/"
#						keiApi="bc4c4106-b876-4e28-b65e-5106e9431213"
#						mensagem="Funcinou Perfeitamente!"
						google-chrome-stable --profile-directory='Default' $url &>- &

#						curl -X POST -H'content-type: application/json' -H"API-KEY: ${keiApi}" -d "{ \"type\": \"text\", \"value\": \"${mensagem}\"}" $urlBot
}

sleep 5s && trabalho
