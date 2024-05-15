#!/usr/bin/env bash

discoMontado="$(lsblk | grep -i '/media/estudo/749C410B9C40C8F6')"
data="$(date +%d-%m-%Y)"
arquivoFinal="backup-$data"
discoMontadoEm="/media/estudo/749C410B9C40C8F6"
discoParte="/dev/sda2"
diretorioDoBackup="/home/brenner/Área de Trabalho/"
diretorioReceberaBackup="$discoMontadoEm/backups"
dias='0'
avisos=('Sendo iniciado o seu backup diário' 'Backup realizado com sucesso' 'Seu backup falhou por algum motivo' 'Foram deletados arquivos com +1 dia' 'Houve erro ao deletar arquivos com +1 dia')

apiKey='bc4c4106-b876-4e28-b65e-5106e9431213'
idBot='385910829'
url="https://backend.botconversa.com.br/api/v1/webhook/subscriber/$idBot/send_message/"
#printf '%s\n' "$disco"

((UID>0)) && { printf '%s\n' "Precisa ser root..." "THAUUUUU" ; sleep 1s; exit 1 ;}
[ ! -e "${diretorioReceberaBackup}" ] && { mkdir "$diretorioReceberaBackup"; printf '%s\n' "O diretorio ${diretorioReceberaBckup} criado com sucesso" ;}

aviso()
{
	curl -X POST -H'Content-Type:application/json' -H"API-KEY: $apiKey" -d"{ \"type\": \"text\", \"value\": \"*${*}*\"}"  "${url}"
}

apagarDados()
{ printf '%s\n' "Apagando seus arquivos"; sleep 5s; }
{
		rm -f ${diretorioReceberaBackup}/*.gz && aviso "${avisos[3]}" || aviso "${avisos[4]}"

}
backup()
{
	tar -czvPpSf "$diretorioReceberaBackup/$arquivoFinal.tar.gz" "$diretorioDoBackup" && aviso "${avisos[1]}" || aviso "${avisos[2]}"
}
if ! mountpoint -q "${discoMontadoEm}"; then
	mount $discoParte $discoMontadoEm
	printf '%s\n' "Seu dispositivo $discoParte montado com sucesso!"
	#apagarDados
else
	printf '%s\n' "Dispositivo $discoParte ja está montado!" "Chamando a função backup"
	sleep 1.5
	#backup
	#apagarDados
fi

#backup # Chamando a função de backup após o delete de arquivos
