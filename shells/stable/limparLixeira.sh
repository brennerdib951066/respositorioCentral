#!/usr/bin/env bash
##########VARIAVEIS DO PROGRAMA##########
diretorioHome="$HOME"
trashHome=".local/share/Trash"
arquivoEnviar="arquivosApagados.txt"
header="Arquivos Apagados"
########################################
tamanhoTrash="$(du -sh $diretorioHome/$trashHome | cut -d'/' -f'1')"
mandandoArquivo="$(du -ch $diretorioHome/$trashHome)"


limparLixeira(){
rm -irv $diretorioHome/$trashHome
echo -e "=======================================================================================================================
            ${header^^}\n
$mandandoArquivo

=======================================================================================================================" | expand -t 10 >> "$arquivoEnviar"
}

 ((${tamanhoTrash//[MKG  ]/}>="16")) && { echo -e "\E[31;1mChamada da funcao\E[m"; limparLixeira  ;} || { echo "Ele nao é maio ou igual"; exit 1 ;}



