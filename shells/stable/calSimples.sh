 #!/usr/bin/env bash

 #Verificando se é Root

 (( "$UID" == 0 )) && { echo "\033[31;1mRoot não!\033[1m"; exit 1 ;}

while [[ -z "$opcao" ]]; do
echo "=========================
            1) somar
            2) subtrair
            3) multiplicar
            4) dividir
            5) sair
====================="
read -p "Escolha alguma das opcaos  " opcao
done

function somar() {
    read -p "digite o primeiro numero " soma1
    read -p "digite o segundo numero  " soma2
    [[ -z "$soma1" || -z "$soma2" ]] && { echo "Entre com algum dado!"; somar ;}
    local resultado=$(("$num1" + "$num2")) # Somando o resultado
    echo "A soma deu "$resultado""
}

function subtrair() {
    read -p "digite o primeiro numero " sub1
    read -p "digite o segundo numero  " sub2
    [[ -z "$sub1" || -z "$sub2" ]] && { echo "Entre com algum dado!"; subtrair ;}
    local resultado=$(("$sub1" - "$sub2")) # Somando o resultado
    echo "A soma deu "$resultado""
}

function multiplicar() {
    read -p "digite o primeiro numero " mult1
    read -p "digite o segundo numero  " mult2
    [[ -z "$mult1" || -z "$mult2" ]] && { echo "Entre com algum dado!"; multiplicar ;}
    local resultado=$(("$mult1" * "$mult2")) # Somando o resultado
    echo "A soma deu "$resultado""
}

function dividir() {
    read -p "digite o primeiro numero " div1
    read -p "digite o segundo numero  " div2
    [[ -z "$div1" || -z "$div2" ]] && { echo "Entre com algum dado!"; dividir ;}
    local resultado=$(("$div1" / "$div2")) # Somando o resultado
    echo "A soma deu "$resultado""
}


case $opcao in
        1) somar            ;;
        2) subtrair         ;;
        3) multiplicar      ;;
        4) dividir          ;;
        5) { echo "Saindo do Programa"\ ;
        exit 1 ; }             ;;
esac