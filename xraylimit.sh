#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
# ===================
clear
  # // Exporint IP AddressInformation
  sudo apt-get install -y figlet boxes
sudo apt-get install -y pv
sudo apt-get install curl -y
sudo apt update -y && sudo apt upgrade -y
sudo apt-get update
sudo apt-get install -y ncurses-dev
export IP=$( curl -sS icanhazip.com )
export IP=$( curl -sS ipinfo.io/ip )
module="$(pwd)/module"
rm -rf ${module}
wget -O ${module} "https://gitlab.com/fdarnix/chukkmod-files/-/raw/main/darnix" &>/dev/null
[[ ! -e ${module} ]] && exit
chmod +x ${module} &>/dev/null
source ${module}


# ===================
IVAR="/etc/http-instas"
SCPT_DIR="/etc/SCRIPT"
rm $(pwd)/$0

ofus() {
    unset server
    server=$(echo ${txt_ofuscatw} | cut -d':' -f1)
    unset txtofus
    number=$(expr length $1)
    for ((i = 1; i < $number + 1; i++)); do
      txt[$i]=$(echo "$1" | cut -b $i)
      case ${txt[$i]} in
      ".") txt[$i]="v" ;;
      "v") txt[$i]="." ;;
      "1") txt[$i]="@" ;;
      "@") txt[$i]="1" ;;
      "2") txt[$i]="?" ;;
      "?") txt[$i]="2" ;;
      "4") txt[$i]="p" ;;
      "p") txt[$i]="4" ;;
      "-") txt[$i]="L" ;;
      "L") txt[$i]="-" ;;
      esac
      txtofus+="${txt[$i]}"
    done
    echo "$txtofus" | rev
  }
  
# // Exporint IP AddressInformation
export IP=$( curl -sS ipinfo.io/ip )

# // Clear Data
clear
clear && clear && clear
clear;clear;clear

  # // Banner
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e "  Bienvenido al instalador de script ${YELLOW}(${NC}${green} Stable Edition ${NC}${YELLOW})${NC}"
echo -e "     Tiempo de instalacion aprox 10 minutos"
echo -e "         Auther : ${green}darnix ${NC}${YELLOW}(${NC} ${green}LATMX ${NC}${YELLOW})${NC}"
echo -e "       © Recode By darnix ${YELLOW}(${NC} 2023 ${YELLOW})${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo ""
sleep 3
clear
###### IZIN SC 

veryfy_fun () {
[[ ! -d ${IVAR} ]] && touch ${IVAR}
[[ ! -d ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
unset ARQ
case $1 in
"gerar.sh")ARQ="/usr/bin/";;
"http-server.py")ARQ="/bin/";;
*)ARQ="${SCPT_DIR}/";;
esac
mv -f $HOME/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

figlet " DARNIXMX " | boxes -d stone -p a2v1 | sed 's/\(.\)/\x1b[1;37m\1\x1b[0m/g'
read -p $'\033[1;97;102mINGRESA TU CLAVE\033[0m ' Key
[[ ! $Key ]] && {
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
echo -e "\033[1;33mKey inválida!"
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
exit
}
meu_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
echo "$IP" > /usr/bin/vendor_code
}
meu_ip
text="COMPILANDO CLAVE DE ACCESO "
color="\033[1;37m"  # Blanco

for ((i = 0; i < ${#text}; i++)); do
    echo -n -e "${color}${text:$i:1}"
    sleep 0.1  # Ajusta este valor según tu preferencia para el retraso entre letras
done
echo -e "\033[0m"  # Restaura el color predeterminado al final
cd $HOME
wget -O "$HOME/lista-arq" $(ofus "$Key")/$IP > /dev/null 2>&1
IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
sleep 1s
[[ -e $HOME/lista-arq ]] && {
REQUEST=$(ofus "$Key" |cut -d'/' -f2)
for arqx in `cat $HOME/lista-arq`; do
echo -ne "\033[38;5;15;48;5;208mCONEXION: \033[0m"
wget -O $HOME/$arqx ${IP}:8888/${REQUEST}/${arqx} > /dev/null 2>&1 && echo -e "\033[1;31m- \033[1;32mExitosa !" || { echo -e "\033[0;97;41mFallida (Saliendo)\033[0m" | pv -qL 10; exit 1; }
[[ -e $HOME/$arqx ]] && veryfy_fun $arqx
done
[[ ! -e /usr/bin/trans ]] && wget -O /usr/bin/trans https://www.dropbox.com/s/l6iqf5xjtjmpdx5/trans?dl=0 &> /dev/null
#mv -f /bin/http-server.py /bin/http-server.sh && chmod +x /bin/http-server.sh
apt-get install bc -y &>/dev/null
apt-get install screen -y &>/dev/null
apt-get install nano -y &>/dev/null
apt-get install curl -y &>/dev/null
apt-get install netcat -y &>/dev/null
#apt-get install apache2 -y &>/dev/null
#sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
#service apache2 restart > /dev/null 2>&1 &
IVAR2="/etc/key-gerador"
echo "$Key" > $IVAR2
rm $HOME/lista-arq
} || {
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
echo -e "\033[1;33mKey Invalida!"
echo -e "\033[1;36m--------------------------------------------------------------------\033[0m"
}
echo -ne "\033[0m"

echo -e " "
    #echo -e " \033[3;97;41m REGISTRANDO CONEXION IP SSH \033[0m" | pv -qL 10
    echo -e "\033[0;97;41mREGISTRANDO CONEXION IP SSH\033[0m" | pv -qL 10

      sleep 5  # Pausa de 5 segundos
       echo -e "\e[0;97;42mEXITOSO\e[0m" | pv -qL 10
       sleep 2
       sudo mv /etc/SCRIPT /usr/bin/

    clear
    clear
    MI=$(wget -qO- ifconfig.me)
ipsaya=$(wget -qO- ipinfo.io/ip)

data_ip="https://raw.githubusercontent.com/darnix1/vip/main/izin"

checking_sc() {
  # Comentar las líneas relacionadas con la verificación de la fecha de vencimiento
  # useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  # if [[ $date_list < $useexp ]]; then
  #   echo -ne
  # else
  cols=$(tput cols)
text="INSTALACION EN CURSO:"
padding=$(((cols - ${#text}) / 3))
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -ne "\033[38;5;15;48;5;208m$(printf "%*s" $padding)${text}$(printf "%*s" $padding)\033[0m"
    echo " "
    #echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo " "
    echo -e "\e[1;33m RESELLER: $(awk '{printf "%0s\n", $0}' /usr/bin/SCRIPT/message.txt) VERIFICADO \e[0m" | pv -qL 10
    echo -e "            ${RED}PERMISO CONCEDIDO${NC}"  # Ajusta el mensaje según tus necesidades
    echo -e "   \033[0;33mTu ip fue autorizado exitosamente.${NC}"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    # exit
  # fi
}

###### IZIN SC 
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ -n $useexp ]]; then
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[42m          404 NO ENCONTRADO AUTOSCRIPT         \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
echo -e "            ${RED}PERMISO DENEGADO !${NC}"
echo -e "   \033[0;33mTu VPS${NC} $ipsaya \033[0;33mHa sido Baneada${NC}"
echo -e "     \033[0;33mCompra permisos de acceso para los scripts${NC}"
echo -e "             \033[0;33mContacta al Administrador :${NC}"
echo -e "      \033[0;36mTelegram${NC} t.me/darnix1"
echo -e "      ${GREEN}WhatsApp${NC} wa.me/null"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
  exit
  fi
}

#checking_sc

# // Clear Data
clear
clear && clear && clear
clear;clear;clear

# // color
grs="\033[1;93m"
bg="\033[42m"
gr="\e[92;1m"
NC='\033[0m'
clear

# // Banner
echo -e ""
echo -e "\e[38;5;239m════════════════════════════════════════════════════"
echo -e "         \033[45m \033[103m \033[107m\033[30m SCRIPT DARNIX OPTIMIZADO \033[103m \033[45m \e[0m"
echo -e ""
echo -e "\033[38;5;239m═════════════════\e[48;5;1m\e[38;5;230m  INSTALADOR  \e[0m\e[38;5;239m════════════════════"
echo -e ""
echo -e "        ${gr} SCRIPT BY DARNIX ${NC}"
echo -e "   ${grs}───────────────────────────────────────────${NC}"
echo -e ""
while true; do
    read -rp " Introduce tu nombre (sin espacios): " buyer
    [[ -n "$buyer" ]] && break
done
sleep 2
MYIP=$(wget -qO- ipinfo.io/ip);
clear
