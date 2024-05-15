#!/usr/bin/env bash

chUrl='https://www.youtube.com/feeds/videos.xml?channel_id='
vdUrl='https://youtu.be/'
source "${HOME}/Área de Trabalho/scripts/stable/bibliotecas/cores.txt"

declare -A canal

canal=( [hashtagProgramacao]='UCafFexaRoRylOKdzGBU6Pgg' [denner]='UCerSETV3cRE_oUL4dIR-P1Q' [diolinuxLabe]='UC629vKGFPRc1rz6VDm6OZiQ' [hojeNoMundoMilitar]='UCKu06MmGX1oGwf2j-s2ls9g' [humbertoVolts]='UCM9hlzGLtByT7awBPBdOBpA' [danielLopes]='UCpLR-q8rFLe_rEAXf4PRxRg' [mwInformatica]='UCbK5Us4E-HsXw6fQ1PYUuog' [dxp]='UC8EGrwe_DXSzrCQclf_pv9g' [slack]='UClz3DneoYlccluy4hBlx86Q' [bosonTreinamentos]='UCzOGJclZQvPVgYZIwERsf5g' [gnu]='UCQTTe8puVKqurziI6Do-H-Q' [tempoClimaBrasil]='UC2ndKvRW06pM5KY06knv_Qg' [lre]='UCTZHPKCKOPSkb8UJpbUIqcA'
)


#canal[akita]='UCib793mnUOhWymCh2VJKplQ'

# tags para buscar no filtro
# <yt:videoId>
# <media:title>

PS3=$'\E[31;1mOpção:\E[m   '
select menu in "${!canal[@]}"; do
    case $REPLY in
         1) canalEscolhido="${canal[hashtagProgramacao]}"       ;; # Adicionando a variavel canalEscolhido e Adicionando o index 0 da variavel CANAL
         2) canalEscolhido="${canal[denner]}"                   ;; # Adicionando a variavel canalEscolhido e Adicionando o index 1 da variavel CANAl
         3) canalEscolhido="${canal[diolinuxLabe]}"             ;; # Adicionando a variavel canalEscolhido e Adicionando o index 2 da variavel CANAl
         4) canalEscolhido="${canal[hojeNoMundoMilitar]}"       ;; # Adicionando a variavel canalEscolhido e Adicionando o index 3 da variavel CANAl
         5) canalEscolhido="${canal[humbertoVolts]}"            ;; # Adicionando a variavel canalEscolhido e Adicionando o index 4 da variavel CANAl
         6) canalEscolhido="${canal[danielLopes]}"              ;; # Adicionando a variavel canalEscolhido e Adicionando o index 5 da variavel CANAl
         7) canalEscolhido="${canal[mwInformatica]}"            ;; # Adicionando a variavel canalEscolhido e Adicionando o index 6 da variavel CANAl
         8) canalEscolhido="${canal[dxp]}"                      ;; # Adicionando a variavel canalEscolhido e Adicionando o index 7 da variavel CANAl
         9) canalEscolhido="${canal[slack]}"                    ;; # Adicionando a variavel canalEscolhido e Adicionando o index 8 da variavel CANAl
        10) canalEscolhido="${canal[bosonTreinamentos]}"        ;; # Adicionando a variavel canalEscolhido e Adicionando o index 9 da variavel CANAl
        11) canalEscolhido="${canal[gnu]}"                      ;; # Adicionando a variavel canalEscolhido e Adicionando o index 10 da variavel CANAl
        12) canalEscolhido="${canal[tempoClimaBrasil]}"         ;; # Adicionando a variavel canalEscolhido e Adicionando o index 11 da variavel CANAl
        13) canalEscolhido="${canal[lre]}"                      ;; # Adicionando a variavel canalEscolhido e Adicionando o index 12 da variavel CANAl
    esac
    break
done

awk '
        # Adicionando uma regex para o filtro um ou outro

        function tratamento(tag){
            gsub(/^[[:space:]]+/,"",tag) # Eliminando os espaços iniciais
            gsub(/<[^>]*>/,"",tag)       # Eliminando as tags que vem na saída
            return tag


        }

        /^.*<(yt:videoId)|media:title>.*$/ {
            if ( $0 ~ "<yt:videoId>"){
                vidUrl = "https://youtu.be/" tratamento($0)
            } else {
            print "\n"
                printf "\033[37;1m"tratamento($0)"\033[m"" ""\033[31;1m|\033[m" "\033[33;1m"" "vidUrl"\033[m\n"
            }
        }


' <<< "$(wget $chUrl${canalEscolhido} -qO -)" # Mandado a saída como string para o awk filtrar
