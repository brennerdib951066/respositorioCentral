#!/usr/bin/env bash
instalarLista=("autokey" "beautifulsoup4" "click" "MouseInfo" "opencv-python" "openpyxl" "Pillow" "PyAutoGUI" "Scrapy" "screeninfo" "youtube-dl")



if ! pip install pyautogui 2>-; then
	echo "FALHOu"
	instalarPIP="$(zenity --question --title="Instalação PIP" --text="Vimos que o pip não está instalado! Deseja instalar?" --ok-label="INSTALAR" --cancel-label="Não")"
	[[ "${?}" != 0 ]] || pkexec apt install python3-pip
fi


instalandoPIP(){
	for instalando in "${instalarLista[@]}"; do
		[[ "${instalando}" = "${instalarLista[7]}" ]] && { pkexec apt install python3-tk python3-dev; pkexec apt install gnome-screenshot ;}
		{ echo -e "\E[31;1mChamdando ${instalando}\E[m"; sleep 2s ;}
			pip install "${instalando}"
	done
}
instalandoPIP # Chamando a função INSTALANDOPIP
