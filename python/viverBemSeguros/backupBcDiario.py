#!/usr/bin/env python3.10


import pyautogui as bot
import time
import webbrowser as web
import sys
sys.path.insert(1, '/usr/bin/dibScripts/python/bibliotecas/') # Buscando essa pasta para importar o arquivo
import notificarBotConversa as notificar
import notificacaoTelegram as tg

arquivo = '/home/viverbem/Imagens/imagensBubble/backupBcDiario/backupBcDiario.png'
escrever = '*Backup Version-test*\n\n*_Backup do BC diário realizado com sucesso_*'
qtd = 8
live = 'simmmmmmmmmmm'
time.sleep(2)

for i in range(qtd):

    time.sleep(2)
    if i == 0:
        print(arquivo)
        bot.click(bot.locateCenterOnScreen(arquivo,confidence=0.8),duration=0.5)
    elif i == 6:
        arquivoI = arquivo.replace('Diario.png','Diario_{}.png'.format(i))
        print(arquivoI)
        bot.click(bot.locateCenterOnScreen(arquivoI,confidence=0.8),duration=0.5)
        bot.write('COPY FROM LIVE TO DEVELOPMENT', interval=0.25)
        bot.click(bot.locateCenterOnScreen(arquivoI,confidence=0.8),duration=0.5)
    else:
        arquivoI = arquivo.replace('Diario.png','Diario_{}.png'.format(i))
        print(arquivoI)
        bot.click(bot.locateCenterOnScreen(arquivoI,confidence=0.7),duration=0.5)

notificar.notificacao(escrever,live)
idChat = '-1002055507416'
tg.notificar(idChat,escrever)
