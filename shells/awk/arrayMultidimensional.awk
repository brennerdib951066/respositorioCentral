#!/usr/bin/env -S awk -f



BEGIN{
    FS=","
    arquivo = "dados.txt"
    $2 ~ /maria/
}


{
    print $2,$1 #>> arquivo
}
