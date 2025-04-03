#!/bin/bash

[[ -e /bin/xdarnix/msg ]] && source /bin/xdarnix/msg || source <(curl -sSL https://raw.githubusercontent.com/darnix1/license/main/msg)



#Termina Metodo
######

biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(curl ifconfig.me)
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export yl='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
DATE2=$(date -R | cut -d " " -f -5)
Exp2=$(curl -sS https://raw.githubusercontent.com/darnix1/permission/refs/heads/main/ip | grep $MYIP | awk '{print $3}')
export RED='\033[0;31m'
export GREEN='\033[0;32m'
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/darnix1/permission/refs/heads/main/ip"
function check_and_update() {
    # Mendapatkan commit terbaru dari repository GitHub
    latest_commit=$(curl -s https://api.github.com/repos/darnix1/mx2/commits/main | grep -oP '"sha": "\K[^"]+')
    commit_messages=$(curl -s https://api.github.com/repos/darnix1/mx2/commits/main | grep -oP '"message": "\K[^"]+')

    # Mendapatkan commit terakhir yang disimpan di VPS
    if [ -f /etc/github/last_commit ]; then
        last_commit=$(cat /etc/github/last_commit | awk '{print $1}')
        last_update_time=$(cat /etc/github/last_commit | awk '{print $2, $3}')
    else
        last_commit=""
        last_update_time="Never"
    fi

    # Jika ada pembaruan, tampilkan notifikasi dan tanyakan apakah ingin melakukan update
    if [ "$latest_commit" != "$last_commit" ]; then
        # Tampilkan notifikasi
        echo -e "╭═════════════════════════════════════════════════════════╮"
        echo -e "│ • UPDATE SCRIPT AVAILABLE •                             │"
        echo -e "│ Repository: jvoscript/autoscript-vip                    │"
        echo -e "│ Latest Changes:                                         │"
        
        # Menampilkan daftar perubahan (commit messages)
        IFS=$'\n'  # Mengubah pemisah field menjadi newline
        count=1
        for message in $commit_messages; do
            echo -e "│ $count. $message"
            count=$((count + 1))
        done

        echo -e "╰═════════════════════════════════════════════════════════╯"

        # Tampilkan informasi update terakhir
        echo -e "Last update: $last_update_time"

        # Tanyakan kepada pengguna apakah ingin melakukan update
        read -p "Do you want to update the script? (Y/N): " update_choice
        if [[ "$update_choice" == "Y" || "$update_choice" == "y" ]]; then
            echo "Updating script..."

            # Download dan jalankan script update
            wget -q https://raw.githubusercontent.com/darnix1/mx2/refs/heads/main/menu/m-update.sh -O m-update.sh
            chmod +x m-update.sh
            ./m-update.sh

            # Simpan commit terbaru dan timestamp ke file
            update_time=$(date +"%Y-%m-%d %H:%M:%S")
            echo "$latest_commit $update_time" > /etc/github/last_commit
            echo "Actualización completada $update_time."
        else
            echo "Update skipped."
        fi
    fi
    # Jika tidak ada update, langsung kembali tanpa menampilkan pesan
}

# Mulai pengecekan update di background
auto_check_update 

clear
#checking_sc
cd
if [ ! -e /etc/per/id ]; then
mkdir -p /etc/per
echo "" > /etc/per/id
echo "" > /etc/per/token
elif [ ! -e /etc/perlogin/id ]; then
mkdir -p /etc/perlogin
echo "" > /etc/perlogin/id
echo "" > /etc/perlogin/token
elif [ ! -e /usr/bin/id ]; then
echo "" > /usr/bin/idchat
echo "" > /usr/bin/token
fi
if [ ! -e /etc/xray/ssh ]; then
echo "" > /etc/xray/ssh
elif [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
elif [ ! -e /etc/xray/sshx/listlock ]; then
echo "" > /etc/xray/sshx/listlock
elif [ ! -e /etc/vmess ]; then
mkdir -p /etc/vmess
elif [ ! -e /etc/vmess/listlock ]; then
echo "" > /etc/vmess/listlock
elif [ ! -e /etc/vless ]; then
mkdir -p /etc/vless
elif [ ! -e /etc/vless/listlock ]; then
echo "" > /etc/vless/listlock
elif [ ! -e /etc/trojan ]; then
mkdir -p /etc/trojan
elif [ ! -e /etc/trojan/listlock ]; then
echo "" > /etc/trojan/listlock
elif [ ! -e /etc/xray/noob ]; then
echo "" > /etc/xray/noob
elif [ ! -e /etc/trojan-go/trgo ]; then
echo "" > /etc/trojan-go/trgo
fi
clear
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/etc/t1
bulan=$(date +%b)
tahun=$(date +%y)
ba=$(curl -s https://pastebin.com/raw/0gWiX6hE)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /etc/t1)" != '0' ]; then
bulan=$(date +%b)
month=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $9}')
month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $10}')
month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $3}')
month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $4}')
month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $6}')
month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $7}')
else
bulan2=$(date +%Y-%m)
month=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $8}')
month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $9}')
month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $2}')
month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $3}')
month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $5}')
month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /etc/t1)" != '0' ]; then
yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
yesterday=NULL
yesterday_v=NULL
yesterday_rx=NULL
yesterday_rxv=NULL
yesterday_tx=NULL
yesterday_txv=NULL
fi
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
status_ws="${COLOR1}ON${NC}"
else
status_ws="${RED}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
status_nginx="${COLOR1}ON${NC}"
else
status_nginx="${RED}OFF${NC}"
systemctl start nginx
fi
if [[ -e /usr/bin/kyt ]]; then
nginx=$( systemctl status kyt | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
echo -ne
else
systemctl start kyt
fi
fi
rm -rf /etc/status
xray=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
status_xray="${COLOR1}ON${NC}"
else
status_xray="${RED}OFF${NC}"
fi

stat_noobz=$( systemctl status noobzvpns | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $stat_noobz == "running" ]]; then
    stat_noobz="${COLOR1}ON${NC}"
else
    stat_noobz="${RED}OFF${NC}"
    systemctl start noobzvpns
fi

# // Dropbear
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $dropbear_status == "running" ]]; then
   status_beruangjatuh="${COLOR1}ON${NC}"
else
   status_beruangjatuh="${RED}OFF${NC}"
fi

udp_custom=$( systemctl status udp-custom | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $udp_custom == "running" ]]; then
    status_udp="${COLOR1}ON${NC}"
else
    status_udp="${RED}OFF${NC}"
    systemctl start udp-custom
fi

stat_trgo=$( systemctl status trojan-go | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $stat_trgo == "running" ]]; then
    stat_trgo="${COLOR1}ON${NC}"
else
    stat_trgo="${RED}OFF${NC}"
    systemctl start trojan-go
fi



# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Registered)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
if [[ $today < $Exp2 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
# TOTAL CREATE ACC VMESS
vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
# TOTAL CREATE ACC VLESS
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
# TOTAL CREATE ACC TROJAN
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
# TOTAL CREATE ACC SSH
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")
# TOTAL CREATE ACC NOOBZ
jumlah_noobz=$(grep -c -E "^### " "/etc/xray/noob")
# TOTAL CREATE ACC TROJAN-GO
jumlah_trgo=$(grep -c -E "^### " "/etc/trojan-go/trgo")
function m-ip2(){
clear
cd
rm -rf /etc/github
if [[ -e /etc/github/api ]]; then
m-ip
else
mkdir /etc/github
echo "000_000000000000000000000000000000000000" > /etc/github/api
echo "josecarlosmeza@gmail.com" > /etc/github/email
echo "josecarlosmeza" > /etc/github/username
m-ip
fi
}
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
function m-bot2(){
clear
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1  ${WH}Please select a Bot type below                 ${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1  [ 1 ] ${WH}Buat/Edit BOT INFO Multi Login SSH, XRAY & TRANSAKSI   ${NC}"
echo -e "$COLOR1  [ 2 ] ${WH}Buat/Edit BOT INFO Create User & Lain Lain    ${NC}"
echo -e ""
echo -e "$COLOR1  [ 3 ] ${WH}Buat/Edit BOT INFO Backup Telegram    ${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
read -p "   Please select numbers 1-3 or Any Button(Random) to exit : " bot
echo ""
if [[ $bot == "1" ]]; then
clear
rm -rf /etc/perlogin
mkdir -p /etc/perlogin
cd /etc/perlogin
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Multi Login"
read -rp "Enter Token (Creat on @BotFather) : " -e token2
echo "$token2" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat
echo "$idat" > id
sleep 1
m-bot2
fi
if [[ $bot == "2" ]]; then
clear
rm -rf /etc/per
mkdir -p /etc/per
cd /etc/per
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Akun Dan Lain Lain"
read -rp "Enter Token (Creat on @BotFather) : " -e token3
echo "$token3" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat2
echo "$idat2" > id
sleep 1
m-bot2
fi
if [[ $bot == "3" ]]; then
clear
rm -rf /usr/bin/token
rm -rf /usr/bin/idchat
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Backup Telegram"
read -rp "Enter Token (Creat on @BotFather) : " -e token23
echo "$token23" > /usr/bin/token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idchat
echo "$idchat" > /usr/bin/idchat
sleep 1
m-bot2
fi
menu
}
clear
clear && clear && clear
clear;clear;clear
resd=$(cat /etc/newadm/message.txt)
msg -bar
msg -tit
msg -bar
echo -e "\033[38;5;239m═════════════════\e[48;5;1m\e[38;5;230m  MENU AUTO  \e[0m\e[38;5;239m════════════════════"
echo -e "\033[1;37m  •  S.O         \033[1;32m$MODEL2 \033[1;31m. \033[1;33m"
echo -e "\033[1;37m  •  DOMINIO     \033[1;32m$(cat /etc/xray/domain) \033[1;31m. \033[1;33m"
#echo -e "\033[1;37m  •  SERVIDOR    \033[1;32m$MYIP \033[1;31m. \033[1;33m"
echo -e "\033[1;37m  •  RAM USADO   \033[1;32m$tram / $uram MB \033[1;31m. \033[1;33m"
echo -e "\033[1;37m  •  AUTOR       \033[1;32m$author"
echo -e "\033[1;37m  •  $resd"
echo -e "\033[38;5;239m═════════════════\e[48;5;2m\e[38;5;22m   SERVICIOS   \e[0m\e[38;5;239m════════════════════"

#echo -e "  \033[1;97m[ SSHWS : ${status_ws} ] \033[1;97m [ XRAY : ${status_xray} ]\033[1;97m [ NGINX : ${status_nginx} ]" 
echo -e "  \033[1;97m[ SSHWS : ${status_ws} \033[1;97m] \033[1;97m[ XRAY : ${status_xray} \033[1;97m] \033[1;97m[ NGINX : ${status_nginx} \033[1;97m]"
akun1="SSHWS"
akun2="VMESS"
akun3="VLESS"
akun4="TROJAN"
akun5="SHDW"
akun01="$total_ssh"
akun02="$vmess"
akun03="$vless"
akun04="${trtls}"
akun05="$ssa"
garis="${grs}║"
echo -e "\033[38;5;239m══════════════\e[100m\e[97m  CONTROL DE REGISTRO  \e[0m\e[38;5;239m═══════════════"
echo -e "\033[1;97m  $akun1:\033[93m[\033[1;92m$akun01\033[93m]\033[1;97m  $akun2:\033[93m[\033[1;92m$akun02\033[93m]\033[1;97m  $akun3:\033[93m[\033[1;92m$akun03\033[93m]\033[1;97m  $akun4:\033[93m[\033[1;92m$akun04\033[93m]\033[1;97m"
echo -e "\e[38;5;239m════════════════════════════════════════════════════"
#echo -e "$COLOR1╔════════════════════ • MENU • ════════════════════╗${NC}"
msg -bar
echo -ne "\e[1;93m  [\e[1;32m1\e[1;93m]\033[1;31m • \e[1;97mSSH OPENVPN" && echo -e "   \e[1;93m  [\e[1;32m7\e[1;93m]\033[1;31m • \e[1;97mNOTIBOT"
echo -ne "\e[1;93m  [\e[1;32m2\e[1;93m]\033[1;31m • \e[1;97mXRAY/VMESS"  && echo -e "    \e[1;93m  [\e[1;32m8\e[1;93m]\033[1;31m • \e[1;97mTEMAS"
echo -ne "\e[1;93m  [\e[1;32m3\e[1;93m]\033[1;31m • \e[1;97mXRAY/VLESS"  && echo -e "    \e[1;93m  [\e[1;32m9\e[1;93m]\033[1;31m • \e[1;97mUPDATE"
echo -ne "\e[1;93m  [\e[1;32m4\e[1;93m]\033[1;31m • \e[1;97mTROJAN"      && echo -e "        \e[1;93m  [\e[1;32m10\e[1;93m]\033[1;31m • \e[1;97mSISTEMA"
echo -ne "\e[1;93m  [\e[1;32m5\e[1;93m]\033[1;31m • \e[1;97mSERVICIOS" && echo -e "     \e[1;93m  [\e[1;32m11\e[1;93m]\033[1;31m • \e[1;97mBACKUP"
echo -ne "\e[1;93m  [\e[1;32m6\e[1;93m]\033[1;31m • \e[1;97mTELEGRAM BOT"&& echo -e "  \e[1;93m  [\e[1;32m12\e[1;93m]\033[1;31m • \e[1;97mREINICIAR"
#echo -e "$COLOR1╚═══════════════════════════════════════════════════╝${NC}"
msg -bar

datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e "$COLOR1 $NC Expiry In  : $(( (d1 - d2) / 86400 )) Days"
}
function new(){
cat> /etc/cron.d/autocpu << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/3 * * * * root /usr/bin/autocpu
END
echo "Auto-Reboot CPU 100% TURN ON."
sleep 1
menu
}
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
function restartservice(){    
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    systemctl restart nginx
    systemctl restart trojan-go
    systemctl restart xray
    systemctl restart noobzvpns
    systemctl restart daemon
    systemctl restart udp-custom
    systemctl restart ws-dropbear
    systemctl restart ws-stunnel
    systemctl restart openvpn
    systemctl restart cron
    systemctl restart netfilter-persistent
    systemctl restart squid
    systemctl restart badvpn1
    systemctl restart badvpn2
    systemctl restart badvpn3
    systemctl restart client
    systemctl restart server
}
clear
echo -e "$COLOR1 ╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}RESTART SERVICE VPS             ${NC} $NC"
echo -e "$COLOR1 ╰══════════════════════════════════════════╯${NC}"
echo -e ""
echo -e "  \033[1;91m Restart All Service... \033[1;37m"
fun_bar 'res1'

echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
}
function updatews(){
cd
rm -rf *
wget https://raw.githubusercontent.com/darnix1/mx2/refs/heads/main/menu/m-update.sh
clear
chmod +x m-update.sh && ./m-update.sh
}
echo -e "$COLOR1╭═════════════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Versi   ${NC}: ${WH}$(cat /opt/.ver) Version${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Client ${NC} : ${WH}$author${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Durasi ${NC} : ${WH}$certificate hari${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Expiry ${NC} : ${WH}$Exp2 $sts ${NC}"
echo -e "$COLOR1╰═════════════════════════════════════════════════════════╯${NC}"
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; m-trojan ;;
05 | 5) clear ; m-noobz ;;
06 | 6) clear ; m-trgo ;;
07 | 7) clear ; m-bot  ;;
08 | 8) clear ; m-bot2 ;;
09 | 9) clear ; updatews ;;
10 | 10) clear ; m-system ;;
11 | 11) clear ; m-backup;;
12 | 12) clear ; reboot ;;
13 | 13) clear ; m-ip2 ;;
22 | 22) clear ; running;;
23 | 23) clear ; restartservice ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
