#!/usr/bin/env python3.10

import time as t
import requests as api


def notificar(idChat,mensagem):
    urlAPI = 'https://api.telegram.org/bot5919425665:AAFgtdzX6INh56NPu_fUqqQ_AOojoeQlDLc'
    #mensagem = 'teste mesmo'
    #idChat = '-1001171658969'
    print('Me chamou e estou aqui...')
    print('ID: {}\nMensagem {}'.format(idChat,mensagem))
    t.sleep(2)
    headers = {
        'Content-Type': 'application/json'
    }
    body = {
        'chat_id': idChat,
        'parse_mode': 'Markdown', # Tem que passar esse parametro para poder usar negrito,italico etc.
        'text': '{}'.format(mensagem)
    }

    chamada = api.post('{}/sendMessage'.format(urlAPI),json=body,headers=headers)

    if chamada.status_code == 200:
        print('A chamda deu certo')
    else:
        print('Deu algum erro')

