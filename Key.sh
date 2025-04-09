#!/bin/bash
cd $HOME
mkdir /etc/darnix
SCPdir="/etc/newadm"
SCPdirn="/etc/darnix"
SCPinstal="$HOME/install"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/ger-user"
SCPfrm="/etc/ger-frm"
SCPinst="/etc/ger-inst"

dnxroj() { echo -e "\e[1;37;41m${*}\e[0m";}
dnxver() { echo -e "\e[1;37;42m${*}\e[0m";}
dnxvern() { echo -ne "\e[1;37;42m${*}\e[0m";}

[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || apt-get install mlocate -y &>/dev/null
rm $(pwd)/$0 &> /dev/null
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${BRAN}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -bar2)cor="\e[38;5;239m════════════════════════════════════════════════════" && echo -e "${cor}${SEMCOR}";;
  -bar)cor="\e[38;5;239m════════════════════════════════════════════════════" && echo -e "${cor}${SEMCOR}";;
 esac
}
fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
os_system(){ 
 system=$(cat -n /etc/issue |grep 1 |cut -d ' ' -f6,7,8 |sed 's/1//' |sed 's/      //') 
 distro=$(echo "$system"|awk '{print $1}') 
 case $distro in 
 Debian) vercion=$(echo $system|awk '{print $3}'|cut -d '.' -f1);; 
 Ubuntu) vercion=$(echo $system|awk '{print $2}'|cut -d '.' -f1,2);; 
 esac 
 link="https://raw.githubusercontent.com/emirjorge/Script-Z/master/Repositorios/${vercion}.list" 
 case $vercion in 
 8|9|10|11|16.04|18.04|20.04|20.10|21.04|21.10|22.04)wget -O /etc/apt/sources.list ${link} &>/dev/null;; 
 esac 
 }
inst_components () {
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
 #sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
 service apache2 restart > /dev/null 2>&1 &
 }
}

install_fim () {
msg -ama  "Instalaci Completo, Utilize os Comandos" && msg bar2
echo -e " menu / adm" && msg -verm  "Reinicie seu servidor para concluir a instalaca"
msg -bar2
}
ofus () {
unset server
    server=$(echo ${txt_ofuscatw} | cut -d':' -f1)
    unset txtofus
    number=$(expr length $1)
    for ((i = 1; i < $number + 1; i++)); do
        txt[$i]=$(echo "$1" | cut -b $i)
        case ${txt[$i]} in
            ".") txt[$i]="C" ;;
            "C") txt[$i]="." ;;
            "3") txt[$i]="@" ;;
            "@" ) txt[$i]="3" ;;
            "4") txt[$i]="9" ;;
            "9") txt[$i]="4" ;;
            "6") txt[$i]="P" ;;
            "P") txt[$i]="6" ;;
            "L") txt[$i]="K" ;;
            "K") txt[$i]="L" ;;
        esac
        txtofus+="${txt[$i]}"
    done
    echo "$txtofus" | rev
}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst}
case $1 in
"menu"|"message.txt")ARQ="${SCPdir}/";; #Menu
"usercodes")ARQ="${SCPusr}/";; #User
"openssh.sh")ARQ="${SCPinst}/";; #Instalacao
"squid.sh")ARQ="${SCPinst}/";; #Instalacao
"dropbear.sh")ARQ="${SCPinst}/";; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/";; #Instalacao
"ssl.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao
*)ARQ="${SCPfrm}/";; #Ferramentas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}

update_pak () {
fun_ip
echo -e "\033[1;37m     AGUARDE UN MOMENTO \033[1;32m.\033[1;32m.\033[1;33m.\033[1;31m. \033[1;33m"
[[ $(dpkg --get-selections|grep -w "pv"|head -1) ]] || apt install pv -y &> /dev/null 
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || apt-get install lolcat -y &>/dev/null 
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install  -y &>/dev/null
echo ""
msg -bar2
[[ $(echo -e "${vercion}" | grep -w "22.10") ]] && {
echo -e "\e[1;31m  SISTEMA:  \e[33m$distro $vercion \e[1;31m	CPU:  \e[33m$(lscpu | grep "Vendor ID" | awk '{print $3}')" 
echo 
echo -e " ---- SISTEMA NO COMPATIBLE CON EL ADM ---"
echo -e " "
echo -e "  UTILIZA LAS VARIANTES MENCIONADAS DENTRO DEL MENU "
echo ""
echo -e "		[ ! ]  Power by @darnix1  [ ! ]"
echo ""
msg -bar3
exit && exit
}
clear
#dpkg --configure -a > /dev/null 2>&1 && echo -e "\033[94m    ANALIZANDO SISTEMA  | pv -qL 80
apt-get install software-properties-common -y > /dev/null 2>&1 && echo -e "\033[94m    ACTUALIZANDO NUEVOS PAQUETES    " | pv -qL 80
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get install net-tools -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "boxes"|head -1) ]] || apt-get install boxes -y &>/dev/null
sleep 2s
clear&&clear
rm $(pwd)/$0 &> /dev/null 
return
}
clear&&clear
update_pak
clear&&clear




invalid_key () {
[[ -e $HOME/lista-arq ]] && list_fix="$(cat < $HOME/lista-arq)" || list_fix=''
[[ "$list_fix" = "KEY INVALIDA!" ]] && {
IiP="$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"
cheklist="$(curl -sSL $IiP:81/dani/checkIP.log)"
chekIP="$(echo -e "$cheklist" | grep ${Key} | awk '{print $3}')"
chekDATE="$(echo -e "$cheklist" | grep ${Key} | awk '{print $7}')"
msg -bar3
echo ""
[[ ! -z ${chekIP} ]] && { 
varIP=$(echo ${chekIP}| sed 's/[1-5]/X/g')
dnxroj "KEY DETECTA EN LA BASE DE DATOS @botgenmx_bot"
echo -e ""
msg -verm "USADA IP : ${varIP} \n FECHA : ${chekDATE} ! "
echo ""
msg -bar3
read -p "  Responde [ s | n ] : " -e -i "s" x
[[ $x = @(s|S|y|Y) ]] && validar_key || {
exit&&exit
}
} || {
echo -e "    PRUEBA COPIAR BIEN TU KEY "
[[ $(echo "$(ofus "$Key"|cut -d'/' -f2)" | wc -c ) = 18 ]] && echo -e "" || echo -e "\033[1;31m CONTENIDO DE LA KEY ES INCORRECTO"
echo -e "   KEY NO COINCIDE CON EL CODEX DEL ADM "
msg -bar3
tput cuu1 && tput dl1
}
}
msg -bar2 && msg -verm "KEY NO VALIDA! " && msg -bar2
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq
dnxroj "KEY RECHAZADA POR EL GENERADOR @botgenmx_bot"
echo -ne "\033[0;32m "
read -p "  Responde [ s | n ] : " -e -i "s" x
[[ $x = @(s|S|y|Y) ]] && validar_key || {
exit&&exit
}
}



validar_key() {
    while [[ ! $Key ]]; do
        msg -bar2
        figlet ' -DARNIX- ' | boxes -d stone -p a0v0 | lolcat
        msg -bar2
        msg -ne "KEY: " && read Key
        tput cuu1 && tput dl1
    done

    msg -ne "CHECKEY: "
    cd $HOME
    wget -O $HOME/lista-arq $(ofus "$Key")/$IP > /dev/null 2>&1 && echo -e "\033[1;32m Verified" || {
        echo -e "\033[1;32m Verified"
        invalid_key
        exit
    }
    
    IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" > /usr/bin/vendor_code
    sleep 1s
    updatedb
    
    if [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "KEY INVALIDA!") ]]; then
        msg -bar2
        dnxver " TU IP SE ENLAZO EXITOSAMENTE AL BOT "
        
        REQUEST=$(ofus "$Key"|cut -d'/' -f2)
        [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
        pontos="."
        stopping="📍"
        colors=("\033[31m" "\033[32m" "\033[33m" "\033[34m" "\033[35m" "\033[36m")  # Red, Green, Yellow, Blue, Magenta, Cyan
        reset_color="\033[0m"
        
        for arqx in $(cat $HOME/lista-arq); do
            color_index=$(( ${#pontos} % ${#colors[@]} ))
            msg -verm "${stopping}${colors[$color_index]}${pontos}${reset_color}"
            wget -O ${SCPinstal}/${arqx} ${IP}:81/${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun
            tput cuu1 && tput dl1
            pontos+="."
        done
        
        sleep 1s
        msg -bar2
        listaarqs="$(locate "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs   
        inst_components
        echo "$Key" > ${SCPdirn}/key.txt
        [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}   
        [[ ${#id} -gt 2 ]] && echo "pt" > ${SCPidioma} || echo "${id}" > ${SCPidioma}
        [[ ${byinst} = "true" ]] && install_fim
    else
        invalid_key
    fi
}

# Luego puedes llamar a la función cuando la necesites:



# // color
grs="\033[1;93m"
bg="\033[42m"
gr="\e[92;1m"
NC='\033[0m'
clear
validar_key
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
