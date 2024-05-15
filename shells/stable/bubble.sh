#!/usr/bin/env bash

chaveDeAcesso="shell"
####logar Usuario#######
read -p $'\E[31;1mSeu email?\E[m   '          emailUsuario
read -p $'\E[31;1mSua chave de acesso\E[m   ' senhaUsuario


#######
read -p $'\E[31;1mNome?\E[m        '  nome
read -p $'\E[31;1mEmail?\E[m       '  email
read -p $'\E[31;1mSenha?\E[m       '  senha
echo -e $'\E[32;1m\
=====================================================
=               Gerente                             =
=               Supervisor                          =
=               Colaborador                         =
=               Admin Geral                         =
=               cabecaCesar                         =
=====================================================
\E[m'
read -p $'\E[31;1mCargo?\E[m      ' cargo

echo -e $'\E[32;1m\
=====================================================
=               manha                               =
=               tarde                               =
=====================================================
\E[m'
read -p $'\E[31;1mCargo?\E[m      ' peridoComercial
echo -e $'\E[32;1m\
=====================================================
=               B8 (Taguantiga Tarde)               =
=               B9 (Cidade Jardins Tarde)           =
=               B10 (Cidade Jardins Tarde)          =
=               B11 (Cidade Jardins Tarde)          =
=               B12 (Cidade Jardins Manhã)          =
=               B13 (Cidade Jardins Manhã)          =
=               B14 (Jardim Oriente Manhã)          =
=               B15 (Jardim Oriente Manhã)          =
=               B16 (Jardim Oriente Tarde)          =
=               B17 (Jardim Oriente Tarde)          =
=               B18 (Taguatinga Manhã)              =
=               M3  (Minas Tarde)                   =
=               M4  (Contagem Tarde)                =
=               M6  (Minas Manhã)                   =
=               G1  (Goiânia Tarde)                 =
=               P2   (Calebe)                       =
=               Pos Vendas (Valparaiso))            =
=====================================================
\E[m'
read -p $'\E[31;1mEquipe?\E[m     ' equipe
read -p $'\E[31;1mTelefone?\E[m   ' telefone
if [[ "$chaveDeAcesso" != "$senhaUsuario" ]];then
    curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 31bd59817117beb39bc675bd4f0320dc" "https://www.sistemaviverbemseguros.com/version-test/api/1.1/obj/User/" -d "{\"Nome\": \"$nome\",\"email\": \"$email\",\"password\": \"$senha\",\"cargoComercial\":\"$cargo\",\"telefoneComercial\":\"$telefone\",\"tipoDeEquipe\":\"B8 (Taguantiga Tarde)\",\"periodoComercial\":\"$peridoComercial\"}" 1>/dev/null 2>/dev/null
    echo -e "\n\n"${nome^^}" cadastrada(O) com sucesso\n
========================================================="
else
    curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer 31bd59817117beb39bc675bd4f0320dc" "https://www.sistemaviverbemseguros.com/version-test/api/1.1/obj/User/" -d "{\"Nome\": \"$nome\",\"email\": \"$email\",\"password\": \"$senha\",\"cargoComercial\":\"$cargo\",\"telefoneComercial\":\"$telefone\",\"tipoDeEquipe\":\"B8 (Taguantiga Tarde)\",\"periodoComercial\":\"$peridoComercial\"}" >>dados.txt
    echo -e "\n\n"${nome^^}" cadastrada(O) com sucesso!\n
============================================================">>dados.txt
fi
