#!/usr/bin/env bash
pastaGit=".git"
buracoNegro="/dev/null"
gitAdicionar="add ."
gitComentar="commit"
gitBranch="branch -M main"
gitRemotoAdicionar="remote add origin"
gitURL="https://github.com/brennerdib951066/meusScripts.git"
gitEnviar="push -u origin main"

[[ ! -d "$pastaGit" ]] && { git init >>"$buracoNegro" 2>>"$buracoNegro"; echo "Pasta git" criada com sucesso ;}

ls -a
until [[ "$opcaoDeEnvio" ]]; do
    read -p $'\E[31;1mDeseja enviar apenas 1 Arquivo específico?[S/N]\E[m   ' opcaoDeEnvio
    until [[ "$comentar" ]]; do
    read -p $'\E[31;1mEscreva aqui seu commit\E[m   ' comentar
    done
done
if [[ "${opcaoDeEnvio,,}" = "n" ]]; then
    git $gitAdicionar >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitComentar -m "${comentar,,}" >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitBranch >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitRemotoAdicionar $gitURL >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitEnviar>>"$buracoNegro" 2>>"$buracoNegro"
elif [[ "${opcaoDeEnvio,,}" = "s" ]]; then
  until [[ "$arquivoEnviar" ]]; do
    read -p $'Qual arquivo deseja enviar   ' arquivoEnviar
  done
    git add "$arquivoEnviar" >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitComentar -m "${comentar,,}" >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitBranch >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitRemotoAdicionar $gitURL >>"$buracoNegro" 2>>"$buracoNegro"
    git $gitEnviar >>"$buracoNegro" 2>>"$buracoNegro"
else
    echo "Opah algo deu errado!"
fi

echo $'\E[32;1mArquivo(s) enviado(s) com sucesso!\E[m'
