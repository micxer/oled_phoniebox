#!/bin/bash
# Colors: \e[36m=Cyan M ; \e[92m=Light green ; \e[91m=Light red ; \e[93m=Light yellow ; \e[31m=green ; \e[0m=Default ; \e[33m=Yellow ; \e[31m=Red

#Version: 1.9.3 - 20200313
SOURCE_REPO="https://github.com/micxer/oled_phoniebox"
SOURCE_BRANCH="master"

NOCOLOR='\e[0m'
RED="\e[1;91m"
CYAN="\e[1;36m"
YELLOW="\e[1;93m"
GREEN="\e[1;92m"
INSTALL_PATH="/home/pi/oled_phoniebox"

clear
echo -e "////////////////////////////////////////////////////////////////////////////////////////////////////////////////"
echo -e "///${CYAN}                                                                                                          ${NOCOLOR}///";
echo -e "///${CYAN}        ██████╗ ██╗     ███████╗██████╗     ██████╗ ██╗███████╗██████╗ ██╗      █████╗ ██╗   ██╗          ${NOCOLOR}///";
echo -e "///${CYAN}       ██╔═══██╗██║     ██╔════╝██╔══██╗    ██╔══██╗██║██╔════╝██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝          ${NOCOLOR}///";
echo -e "///${CYAN}       ██║   ██║██║     █████╗  ██║  ██║    ██║  ██║██║███████╗██████╔╝██║     ███████║ ╚████╔╝           ${NOCOLOR}///";
echo -e "///${CYAN}       ██║   ██║██║     ██╔══╝  ██║  ██║    ██║  ██║██║╚════██║██╔═══╝ ██║     ██╔══██║  ╚██╔╝            ${NOCOLOR}///";
echo -e "///${CYAN}       ╚██████╔╝███████╗███████╗██████╔╝    ██████╔╝██║███████║██║     ███████╗██║  ██║   ██║             ${NOCOLOR}///";
echo -e "///${CYAN}        ╚═════╝ ╚══════╝╚══════╝╚═════╝     ╚═════╝ ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝             ${NOCOLOR}///";
echo -e "///${CYAN}                                                                                                          ${NOCOLOR}///";
echo -e "///${CYAN}   ███████╗ ██████╗ ██████╗     ██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗██╗███████╗██████╗  ██████╗ ██╗  ██╗   ${NOCOLOR}///";
echo -e "///${CYAN}   ██╔════╝██╔═══██╗██╔══██╗    ██╔══██╗██║  ██║██╔═══██╗████╗  ██║██║██╔════╝██╔══██╗██╔═══██╗╚██╗██╔╝   ${NOCOLOR}///";
echo -e "///${CYAN}   █████╗  ██║   ██║██████╔╝    ██████╔╝███████║██║   ██║██╔██╗ ██║██║█████╗  ██████╔╝██║   ██║ ╚███╔╝    ${NOCOLOR}///";
echo -e "///${CYAN}   ██╔══╝  ██║   ██║██╔══██╗    ██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██║██╔══╝  ██╔══██╗██║   ██║ ██╔██╗    ${NOCOLOR}///";
echo -e "///${CYAN}   ██║     ╚██████╔╝██║  ██║    ██║     ██║  ██║╚██████╔╝██║ ╚████║██║███████╗██████╔╝╚██████╔╝██╔╝ ██╗   ${NOCOLOR}///";
echo -e "///${CYAN}   ╚═╝      ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝   ${NOCOLOR}///";
echo -e "///${CYAN}                                                                                                          ${NOCOLOR}///";
echo -e "////////////////////////////////////////////////////////////////////////////////////////////////////////////////"
echo -e "///                                                                                                          ///"
echo -e "///${CYAN}                               https://github.com/micxer/oled_phoniebox                                   ${NOCOLOR}///"
echo -e "///                                                                                                          ///"
echo -e "////////////////////////////////////////////////////////////////////////////////////////////////////////////////"
echo -e ""
echo -e "${RED}Please notice:${NOCOLOR} This script will install all needed components for the OLED-Display (Format 128 X 64px) with"
echo -e "SH1106- or SSD1306-Controller. A preinstallation of the jukebox4kids or similiar (MPC) will be needed."
echo -e " "
if [ -d "/home/pi/RPi-Jukebox-RFID" ]
then
	echo -e "${GREEN}RPi-Jukebox-RFID seems to be installed${NOCOLOR}"
	echo -e " "
else
	echo -e "${RED}RPi-Jukebox-RFID is missing! Please install necessarily.${NOCOLOR}"
	echo -e " "
fi

echo -e "Do you want to install this OLED-Display-Service?"
echo -e " "
OPTIONS=("Install" "Quit")

select OPT in "${OPTIONS[@]}"
do
    case $OPT in
        "Install")
            break
            ;;

        "Quit")
            exit
            ;;
        *) echo -e "invalid option $REPLY";;
    esac
done

clear
echo -e "////////////////////////////////////////////////////////////////////"
echo -e "///${CYAN}   Please choose your display controller type:                ${NOCOLOR}///"
echo -e "////////////////////////////////////////////////////////////////////"
echo -e ""
echo -e "Which type of OLED-Controller should be installed (needed for the "
echo -e "Service-Startup):?"
echo -e " "
OPTIONS=("ssd1306" "sh1106" "Quit")

select OPT in "${OPTIONS[@]}"
do
    case $OPT in
        "ssd1306")
            CONTROLLER="ssd1306"
            break
            ;;
        "sh1106")
            CONTROLLER="sh1106"
            break
            ;;
        "Quit")
            exit
            ;;
        *) echo -e "Invalid option $REPLY";;
    esac
done

clear
echo -e "////////////////////////////////////////////////////////////////////"
echo -e "///${CYAN}   Please choose your display brightness:                     ${NOCOLOR}///"
echo -e "////////////////////////////////////////////////////////////////////"
echo -e ""
echo -e "Choose your initial setting for brightness, you can change it later:"
echo -e " "
OPTIONS=("1 dark" "2 normal" "3 bright" "4 very bright" "Quit")

select OPT in "${OPTIONS[@]}"
do
    case $OPT in
        "1 dark")
			echo -e ""
            CONTRAST="0"
			echo -e " "
            break
            ;;
        "2 normal")
            echo -e ""
			CONTRAST="85"
			echo -e " "
            break
            ;;
        "3 bright")
            echo -e ""
			CONTRAST="170"
			echo -e " "
            break
            ;;
        "4 very bright")
            echo -e ""
			CONTRAST="255"
			echo -e " "
            break
            ;;
        "Quit")
            exit
            ;;
        *) echo -e "Invalid option $REPLY";;
    esac
done

clear
echo -e "////////////////////////////////////////////////////////////////////"
echo -e "///${CYAN}   Please choose your display mode:                           ${NOCOLOR}///"
echo -e "////////////////////////////////////////////////////////////////////"
echo -e ""
echo -e "${CYAN}Full${NOCOLOR} is a display mode with much informations like"
echo -e "  -> Tracks and Trackinformations"
echo -e "  -> Wifi-Signal"
echo -e ""
echo -e "${CYAN}Lite${NOCOLOR} is a simple display mode just showing the"
echo -e "Tracknr. and WLAN-Signal, other featues like brightness control are"
echo -e "still available."
echo -e ""
echo -e "${CYAN}Mix${NOCOLOR} is a mix between lite and full without"
echo -e "Trackinformations like Name, Album and so on. Just Tracks, WLAN-"
echo -e "Signal, Volume and Length."
echo -e ""
echo -e "Choose your Display mode.:"
echo -e " "
OPTIONS=("Full" "Lite" "Mix" "Quit")
select OPT in "${OPTIONS[@]}"
do
    case $OPT in
        "Full")
			echo -e ""
            MODE="full"
			echo -e " "
            break
            ;;
        "Lite")
            echo -e ""
			MODE="lite"
			echo -e " "
            break
            ;;
        "Mix")
            echo -e ""
			MODE="mix"
			echo -e " "
            break
            ;;
        "Quit")
            exit
            ;;
        *) echo -e "Invalid option $REPLY";;
    esac
done

clear
cd
echo -e "////////////////////////////////////////////////////////////////////"
echo -e "///${CYAN}   Check/Install Prerequirements:                             ${NOCOLOR}///"
echo -e "////////////////////////////////////////////////////////////////////"
echo -e " "
echo -e "Do you want to start the installation of needed packages?"
echo -e " "
OPTIONS=("Install" "Quit")

select OPT in "${OPTIONS[@]}"
do
    case $OPT in
        "Install")
            break
            ;;

        "Quit")
            exit
            ;;
        *) echo -e "invalid option $REPLY";;
    esac
done
echo -e ""
echo -e "Starting installation-process, pleae wait, some steps taking"
echo -e "minutes, especially the luma-Packages..."
echo -e ""
echo -e -n "   --> Update Sources:          "
sudo apt -qq update > /dev/null 2>&1
echo -e "${GREEN}done${NOCOLOR}"
echo -e ""
echo -e "Install packages..."

sudo apt-get -qq --yes install git python3 build-essential python3-dev python3-pip python-pil libjpeg-dev i2c-tools
sudo pip3 install luma.core luma.oled netifaces

echo -e ""
echo -e "Enable I2C..."
if grep -q 'i2c-bcm2708' /etc/modules; then
  echo -e "   --> i2c-bcm2708 module:      ${GREEN}already exists${NOCOLOR}"
else
  echo 'i2c-bcm2708' | sudo tee -a /etc/modules > /dev/null 2>&1
  echo -e "   --> i2c-bcm2708 module:      ${GREEN}activated${NOCOLOR}"
fi
if grep -q 'i2c-dev' /etc/modules; then
  echo -e "   --> i2c-dev module:          ${GREEN}already exists${NOCOLOR}"
else
  echo 'i2c-dev' | sudo tee -a /etc/modules > /dev/null 2>&1
  echo -e "   --> i2c-dev module:          ${GREEN}activated${NOCOLOR}"
fi
if grep -q '^dtparam=i2c1=on' /boot/config.txt; then
  echo -e "   --> i2c1 boot-parameter:     ${GREEN}already set${NOCOLOR}"
else
  echo 'dtparam=i2c1=on' | sudo tee -a /boot/config.txt > /dev/null 2>&1
  echo -e "   --> i2c1 boot-parameter:     ${GREEN}set${NOCOLOR}"
fi
if grep -q '^dtparam=i2c_arm=on' /boot/config.txt; then
  echo -e "   --> i2c_arm boot-parameter:  ${GREEN}already set${NOCOLOR}"
else
  echo 'dtparam=i2c_arm=on' | sudo tee -a /boot/config.txt > /dev/null 2>&1
  echo -e "   --> i2c_arm boot-parameter:  ${GREEN}set${NOCOLOR}"
fi
if [ -f /etc/udev/rules.d/99-i2c.rules ]; then
  if grep -q '^SUBSYSTEM=="i2c-dev", TAG+="systemd"' /etc/udev/rules.d/99-i2c.rules; then
    echo -e "   --> i2c dev dependency:      ${GREEN}already set${NOCOLOR}"
  else
    echo 'SUBSYSTEM=="i2c-dev", TAG+="systemd"' | sudo tee  /etc/udev/rules.d/99-i2c.rules > /dev/null 2>&1
    echo -e "   --> i2c dev dependency:      ${GREEN}set${NOCOLOR}"
  fi
else
  echo 'SUBSYSTEM=="i2c-dev", TAG+="systemd"' | sudo tee  /etc/udev/rules.d/99-i2c.rules > /dev/null 2>&1
  echo -e "   --> i2c dev dependency:      ${GREEN}set${NOCOLOR}"
fi
if grep -q '^dtparam=i2c_arm_baudrate=400000' /boot/config.txt; then
  echo -e "   --> i2c arm_baudrate:        ${GREEN}already set${NOCOLOR}"
else
  echo 'dtparam=i2c_arm_baudrate=400000' | sudo tee -a /boot/config.txt > /dev/null 2>&1
  echo -e "   --> i2c arm_baudrate:        ${GREEN}set${NOCOLOR}"
fi


if [ -f /etc/modprobe.d/raspi-blacklist.conf ]; then
  sudo sed -i 's/^blacklist spi-bcm2708/#blacklist spi-bcm2708/' /etc/modprobe.d/raspi-blacklist.conf
  sudo sed -i 's/^blacklist i2c-bcm2708/#blacklist i2c-bcm2708/' /etc/modprobe.d/raspi-blacklist.conf
fi

echo -e ""
read -n 1 -s -r -p "Press any key to continue"

clear
echo -e "////////////////////////////////////////////////////////////////////"
echo -e "///${CYAN}   Installing Service:                                        ${NOCOLOR}///"
echo -e "////////////////////////////////////////////////////////////////////"
echo -e ""
echo -e "Repository:       ${GREEN}${SOURCE_REPO}${NOCOLOR}"
echo -e "Branch:           ${GREEN}${SOURCE_BRANCH}${NOCOLOR}"
echo -e "Install Path:     ${GREEN}${INSTALL_PATH}${NOCOLOR}"
echo -e "Display Mode:     ${GREEN}${MODE}${NOCOLOR}"
echo -e "Controler Type:   ${GREEN}${CONTROLLER}${NOCOLOR}"
echo -e "Contrast:         ${GREEN}${CONTRAST}${NOCOLOR}"
echo -e ""
echo -e -n "   --> Delete old Service:                "
sudo service oled_phoniebox stop > /dev/null 2>&1
sudo systemctl disable /etc/systemd/oled_phoniebox.service > /dev/null 2>&1
sudo rm /etc/systemd/oled_phoniebox.service > /dev/null 2>&1
echo -e "${GREEN}Done${NOCOLOR}"
echo -e ""
echo -e -n "   --> Delete old Repository:             "
sudo rm -R ${INSTALL_PATH} > /dev/null 2>&1
echo -e "${GREEN}Done${NOCOLOR}"
echo -e ""
echo -e -n "   --> Clone oled_phoniebox Repository:   "

git clone ${SOURCE_REPO} --branch ${SOURCE_BRANCH} ${INSTALL_PATH} > /dev/null 2>&1
echo -e "${GREEN}Done${NOCOLOR}"
echo -e ""
echo -e -n "   --> Write Config-File:                 "
sudo cp ${INSTALL_PATH}/templates/conf.template ${INSTALL_PATH}/oled_phoniebox.conf > /dev/null
sudo sed -i -e "s:<contrastvalue>:${CONTRAST}:g" ${INSTALL_PATH}/oled_phoniebox.conf> /dev/null
sudo sed -i -e "s:<controllervalue>:${CONTROLLER}:g" ${INSTALL_PATH}/oled_phoniebox.conf> /dev/null
sudo sed -i -e "s:<modevalue>:${MODE}:g" ${INSTALL_PATH}/oled_phoniebox.conf> /dev/null
echo -e "${GREEN}Done${NOCOLOR}"
echo -e ""
echo -e -n "   --> Installing Service:                "
sudo chown -R pi:pi ${INSTALL_PATH} > /dev/null
#sudo chmod +x ${INSTALL_PATH}/oled_phoniebox.py > /dev/null
sudo cp ${INSTALL_PATH}/templates/service.template /etc/systemd/oled_phoniebox.service > /dev/null
sudo chown root:root /etc/systemd/oled_phoniebox.service > /dev/null 2>&1
sudo chmod 644 /etc/systemd/oled_phoniebox.service > /dev/null 2>&1
sudo sed -i -e "s:<PATH>:${INSTALL_PATH}:g" /etc/systemd/oled_phoniebox.service > /dev/null
sudo systemctl daemon-reload > /dev/null 2>&1
sudo systemctl enable /etc/systemd/oled_phoniebox.service > /dev/null 2>&1
sudo service oled_phoniebox restart > /dev/null 2>&1
sudo service phoniebox-gpio-buttons restart > /dev/null 2>&1
echo -e "${GREEN}Done${NOCOLOR}"
echo -e ""
echo -e -n "   --> Set Permissons:                    "
sudo chmod 755 /home/pi/oled_phoniebox/scripts/toggle_display/toggle_display.sh > /dev/null 2>&1
echo -e "${GREEN}Done${NOCOLOR}"
echo -e ""
read -n 1 -s -r -p "Press any key to continue"
clear
echo -e "////////////////////////////////////////////////////////////////////"
echo -e "///${CYAN}   Edit gpio-buttons.py                                       ${NOCOLOR}///"
echo -e "////////////////////////////////////////////////////////////////////"
echo -e ""
echo -e "If jukebox4kids is already installed, you can choose your new config"
echo -e "for the file:"
echo -e "  ${YELLOW}/home/pi/RPi-Jukebox-RFID/scripts/gpio-buttons.py${NOCOLOR}"
echo -e ""
echo -e "${CYAN}Option 1:${NOCOLOR} DOES NOT WORK AFTER PHONIEBOX UPDATE 2.2"
echo -e "Just deactivate GPIO Pin 3 for the shutdown. This Pin is needed and"
echo -e "used for I2C-Display! The origin gpio-buttons.py-File from the"
echo -e "RPi-Jukebox-RFID-Repository will be changed!!!"
echo -e ""
echo -e "${CYAN}Option 2:${NOCOLOR} DOES NOT WORK AFTER PHONIEBOX UPDATE 2.2"
echo -e "Replace the gpio-buttons.py-Service with a file from this "
echo -e "Repository for contrast-control with the prev- and next-Buttons."
echo -e "The origin Repository remains untouched."
echo -e ""
echo -e "${CYAN}Option 3:${NOCOLOR}"
echo -e "Just skip... ${RED}Needed, if jukebox4kids is not installed!!!${NOCOLOR}"
echo -e " "
echo -e "I recommend option 2 or 3, because editing the origin service could"
echo -e "make problems!"
echo -e " "
OPTIONS=("Option 3: Skip")

select OPT in "${OPTIONS[@]}"
do
    case $OPT in
        "Option 1: Deactivate GPIO Pin 3")
			echo -e " "
			sudo service phoniebox-gpio-buttons stop > /dev/null 2>&1
            sudo sed -i -e "s:shut = Button(3, hold_time=2):#shut = Button(3, hold_time=2):g" /home/pi/RPi-Jukebox-RFID/scripts/gpio-buttons.py > /dev/null
			sudo service phoniebox-gpio-buttons start > /dev/null 2>&1
			echo -e "   --> Button replacement finished"
			echo -e ""
            break
            ;;
        "Option 2: Replace service for contrast-control")
			echo -e " "
			echo -e -n "   --> Delete old Service:                "
			#sudo chmod +x ${INSTALL_PATH}/scripts/gpio-buttons/gpio-buttons.py > /dev/null
			sudo service phoniebox-gpio-buttons stop > /dev/null 2>&1
			sudo systemctl disable phoniebox-gpio-buttons > /dev/null  2>&1
			sudo rm /etc/systemd/system/phoniebox-gpio-buttons.service > /dev/null  2>&1
			echo -e "${GREEN}Done${NOCOLOR}"
			echo -e -n "   --> Installing Service:                "
			sudo cp ${INSTALL_PATH}/templates/gpio-service.template /etc/systemd/system/phoniebox-gpio-buttons.service > /dev/null 2>&1
			sudo sed -i -e "s:<PATH>:${INSTALL_PATH}:g" /etc/systemd/system/phoniebox-gpio-buttons.service > /dev/null 2>&1
			sudo chown root:root /etc/systemd/system/phoniebox-gpio-buttons.service > /dev/null 2>&1
			sudo chmod 644 /etc/systemd/system/phoniebox-gpio-buttons.service > /dev/null 2>&1
			sudo systemctl enable phoniebox-gpio-buttons > /dev/null 2>&1
			sudo service phoniebox-gpio-buttons start > /dev/null 2>&1
			echo -e "${GREEN}Done${NOCOLOR}"
			echo -e ""
            break
            ;;
        "Option 3: Skip")
			break
            ;;
        *) echo -e "Invalid option $REPLY";;
    esac
done
echo -e ""
read -n 1 -s -r -p "Press any key to continue"

clear
echo -e ""
echo -e "/////////////////////////////////////////////////////////////////////////////////////////////////////////"
echo -e "///                                                                                                   ///"
echo -e "///   ${GREEN}██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗      █████╗ ████████╗██╗ ██████╗ ███╗   ██╗   ${NOCOLOR}///";
echo -e "///   ${GREEN}██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║   ${NOCOLOR}///";
echo -e "///   ${GREEN}██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║   ${NOCOLOR}///";
echo -e "///   ${GREEN}██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║   ${NOCOLOR}///";
echo -e "///   ${GREEN}██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║   ${NOCOLOR}///";
echo -e "///   ${GREEN}╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ${NOCOLOR}///";
echo -e "///                                                                                                   ///";
echo -e "///   ${GREEN} ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗                           ${NOCOLOR}///";
echo -e "///   ${GREEN}██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝                           ${NOCOLOR}///";
echo -e "///   ${GREEN}██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗                             ${NOCOLOR}///";
echo -e "///   ${GREEN}██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝                             ${NOCOLOR}///";
echo -e "///   ${GREEN}╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗                           ${NOCOLOR}///";
echo -e "///   ${GREEN} ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝                           ${NOCOLOR}///";
echo -e "///                                                                                                   ///"
echo -e "/////////////////////////////////////////////////////////////////////////////////////////////////////////"
echo -e ""
echo -e "If this is a new installation, a reboot is required..."
echo -e ""
echo -e "Do you want to reboot now?"
echo -e " "
OPTIONS=("Reboot" "Quit")

select OPT in "${OPTIONS[@]}"
do
    case $OPT in
        "Reboot")
            sudo reboot
            ;;

        "Quit")
            exit
            ;;
        *) echo -e "invalid option $REPLY";;
    esac
done
