#!/usr/bin/env python3.10

import sys
sys.path.insert(1, '/usr/bin/dibScripts/python/bibliotecas/') # Buscando essa pasta para importar o arquivo
# Para importa-lo tem que ser com a extensao .py e não precisa necessáriamente ser um arquivo executavél
import escreverViverBem as rg
import pyautogui as bot
import time as t

pular = [7,11,13,16,18,21,23,26,28,30,34,37,39,41,43,45,47,49,51,53,55,57,59,61] # essa ordem não poderá ser alterada
arquivo = '/home/viverbem/Imagens/imagensBubble/cadastroEtiqueta/cadastroDeEtiquetas'

i = 0
for dado in rg.dados:

    print('{} = {}'.format(dado.upper(),rg.dados[dado]))
    print('{}'.format(i))
    t.sleep(0.1)
    if i in pular:
        print('Agora é pass')
        pass
    elif i == 0:
        bot.click(bot.locateCenterOnScreen('{}.png'.format(arquivo),confidence=0.8),duration=0.25)
        bot.write(rg.dados[dado])
    else:
        bot.click(bot.locateCenterOnScreen('{}_{}.png'.format(arquivo,i),confidence=0.8),duration=0.25)
        bot.write(rg.dados[dado])
        bot.press('down')
        bot.press('enter')

    i += 1
