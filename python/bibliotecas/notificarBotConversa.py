#!/usr/bin/env python3.10

import requests
import time
#import bot

#escrever = 'Testando notificação para os updates'
def notificacao(escrever,live):
    print('VocÊ entrou na funcao')
    if live == 'sim':
        print('LIVEVEVEVE')
        idUser = ['385910829','193741501']
        api_key = 'bc4c4106-b876-4e28-b65e-5106e9431213'

        for ids in idUser:
            print(ids)
            url = 'https://backend.botconversa.com.br/api/v1/webhook/subscriber/{}/send_message/'.format(ids)
            time.sleep(5)

            headers = {
                'Content-Type':'application/json',
                'API-KEY': api_key
            }

            mensagem = {
                    'type': 'text',
                    'value': '*{}*'.format(escrever)
            }

            resposta = requests.post(url,json=mensagem,headers=headers)

            if resposta.status_code == 200:
                print('Mano deu certo!\nPode Prosseguir alegre!')
            else:
                print('Algo deu errado!!!!')
    else:
        print('Entrou no modo de teste')
        print('{}'.format(escrever))
        idUser = '385910829'
        api_key = 'bc4c4106-b876-4e28-b65e-5106e9431213'
        url = 'https://backend.botconversa.com.br/api/v1/webhook/subscriber/{}/send_message/'.format(idUser)

        time.sleep(5)

        headers = {
            'Content-Type':'application/json',
            'API-KEY': api_key
        }

        mensagem = {
                'type': 'text',
                'value': '*{}*'.format(escrever)
        }

        resposta = requests.post(url,json=mensagem,headers=headers)

        if resposta.status_code == 200:
            print('Mano deu certo!\nPode Prosseguir alegre!')
        else:
            print('Algo deu errado!!!!')

#notificacao(escrever)
# FIM DO PROGRAMA PYTHON

#print('TERMINOU')
