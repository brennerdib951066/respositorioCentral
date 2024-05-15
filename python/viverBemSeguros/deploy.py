#!/usr/bin/env python3


import pyautogui as bot
import time
import sys
diretorioPath = '/usr/bin/dibScripts/python/bibliotecas'
sys.path.insert(1,diretorioPath)
import notificarBotConversa as notificar
import notificarNtfy as notificarN
import notificacaoTelegram as tg
from datetime import datetime # Importando modulo para pegar a data e hora atual
####################VARIAVEIS DO PROGRAMA##################
#caminhoBase= '/home/Imagens/imagensBubble/deploy'
arquivo = ['/home/viverbem/Imagens/imagensBubble/deploy/deployBubble.png','/home/viverbem/Imagens/imagensBubble/deploy/deployBubble_1.png',
'/home/viverbem/Imagens/imagensBubble/deploy/deployBubble_2.png',
'/home/viverbem/Imagens/imagensBubble/deploy/deployBubble_3.png',
'/home/viverbem/Imagens/imagensBubble/deploy/deployBubble_4.png']
layout = '============================'
dataHoraAtual = datetime.now()
dataHoraAtualBrasileira = dataHoraAtual.strftime("%d/%m/%Y %H:%M:%S")

live = 'sim'
escrever = ['main','deploy','descricao','*UPDATE VIVER BEM*\n{}\n\n# Inserida uma condicional de data, para mostrar somente as etiquetas cadastradas depois de 2023\n\n#  Essa é a versão (4.0.0.0.0.20)\n\n{} *{}*'.format(layout,layout,dataHoraAtualBrasileira),'confirmar']



def deploy(live,escrever):
	if live == 'nao':                      # Verificando se a variavél teste tem o valor sim, se tiver apenas irá notificar
		print('LIVE é {}'.format(live))
		escrever = '*Seu deploy de hoje não foi possivel faze-lo*\n*Pois está no modo teste*'
		notificar.notificacao(escrever,live)
	else:
		print('LIVE é {}'.format(live))
		time.sleep(5)
		tamanho= len(arquivo)

		for i in range(tamanho):
			if i == 3:
				time.sleep(10)
				bot.write(escrever[3])
			time.sleep(3)
			bot.click(bot.locateCenterOnScreen(arquivo[i],confidence=0.8),duration=0.5)

		print(tamanho)
		escrever = escrever[3]
		notificar.notificacao(escrever,live) # Chamando a função de notificar bot notificarBotConversa
		notificarN.notificacaoNtfy(escrever) # Chamando a função de notificar NTFY

deploy(live,escrever) # Chamando a função de dar o deploy e enviado para ela os parametros teste e escrever

idChat = '-1002055507416' # Aqui é o id do chat updateViverBem
mensagem = escrever[3]
tg.notificar(idChat,mensagem)



