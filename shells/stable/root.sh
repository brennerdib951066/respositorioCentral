#!/usr/bin/env bash

#Variavel de arquivo
arquivo="receber.txt" && [[ ! -e "$arquivo" ]] && touch "$arquivo"
