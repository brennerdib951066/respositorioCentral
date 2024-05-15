#!/usr/bin/env bash

nome="brenner santos"

echo -e "\E[31;3mChamando python agora\E[m"; sleep 1s

nome=$(python3.10 '/home/estudo/Área de Trabalho/pythons/praticas/script.py' "${nome}")

echo -e "\E[33;3mO nome do galã é ${nome}\E[m"
