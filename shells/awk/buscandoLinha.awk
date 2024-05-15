#!/usr/bin/env -S awk -f


BEGIN {
    FS=","
    arquivo = "outros.txt"
    abrirCorVermelho = "\033[31;3m"
    fechaCor = "\033[m"
    print "Digite a a busca:"
    getline busca < "-"


    while((getline linha < arquivo)>0){
        if (tolower(linha) ~ tolower(busca)) {
                printf abrirCorVermelho""linha""fechaCor"\n"
        }
    }
}
