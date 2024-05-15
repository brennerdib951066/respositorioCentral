#!/usr/bin/env bash

localzinho="xdotool getmouselocation --shell"
    X=("xdotool mousemove" "sleep 1s click 1")
    chave="1"
    arquivo="localMouse.txt"
    mapfile -t buscar < "${arquivo}"
function localMouse(){

    until  [[ ${chave} = "0" ]]; do
        corte=$(eval $localzinho | grep -iEw "[0-9]{3,4}" | paste -s )
        echo "${corte//[X=Y]/}" >> "${arquivo}"
        echo "$l"

         ((l<80)) && { sleep 5s; ((++l)); localMouse; } || break


    done

}

#localMouse ## Chamando A Função LOCALMOUSE

function automacao(){
r=1
for buscando in "${buscar[@]}" ; do
        read receber[$r]<<<"${buscando}"
        ((r++))
        echo "${r}"
        sleep 0.5
        [[ "${r}" = "7" ]] && sleep 8s
        ((r==8&&r<=13)) && X[1]=""
        eval ${X[0]} ${buscando//type/click 1 type} ${X[1]}
done
}
automacao
