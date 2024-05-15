#!/usr/bin/env python3.10

import pyautogui as bot
import time as t

arquivo = '/usr/bin/dibScripts/python/udemy/loginUdemy'
escrever = [('Dib@65251600')]

i = 1
t.sleep(10)
for senha in escrever:
    bot.click(bot.locateCenterOnScreen('{}.png'.format(arquivo),confidence=0.8),duration=0.5)
    bot.write(senha)
    t.sleep(1)
    bot.click(bot.locateCenterOnScreen('{}_{}.png'.format(arquivo,i),confidence=0.8),duration=0.25)
