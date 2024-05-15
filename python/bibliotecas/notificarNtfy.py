#!/usr/bin/env python3.10

import requests as chamada
import time as t

#escrever = 'Testando a notificação NTFY PYTHON'
def notificacaoNtfy(escrever):
    print('DENTRO DA FUNÇÃO')
    t.sleep(1)
    chamada.post("https://ntfy.sh/atualizacao",escrever,

        headers={
            "Title": "Update disponivel no app sistema viver bem",
            "Attach": "https://c73cb1067cdf154944fa6442290ea297.cdn.bubble.io/f1707941296226x902415739913466000/logoviverbem.png?_gl=1*cp3f4e*_gcl_au*NjUzNjMzNjMuMTcxMzI2MjE4OQ..*_ga*MTE2NDA1MDU1LjE3MTMyNjIxODk.*_ga_BFPVR2DEE2*MTcxMzM0Nzc5Mi4yLjEuMTcxMzM4MTUxNi41MS4wLjA.",
            "Priority": "urgent",
            "Tags": "warning,skull"
        })
print('Chamndo a função')
t.sleep(2)
#notificacaoNtfy(escrever)
