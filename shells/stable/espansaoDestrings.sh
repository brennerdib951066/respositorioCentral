#!/usr/bin/env bash

            #Retorna a quantidade de strings em uma variavel

#nome="Brenner"

#echo "${#nome}"

            #Corta o inicio da strings e somente ela

#nome="Brenner Bonito"

#echo "${nome#Brenner }" # Caso queira eliminar o espaço que fica basta da um espaço tambem!

            #Elimina as strings da posição onde especificada
#nome="Brenner Gato"

#echo "${nome:8}" #Uma Variação é apenas acrecentar mais dois pontos de outro numero

            #Substituir o valor de uma variavel caso ele comece com

animal="baleia mosca cachorro burro"

echo "${animal/#baleia/foca}" # Caso queira o que termine com burro troque # por %
