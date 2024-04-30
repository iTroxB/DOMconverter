#!/bin/bash
# Author: iTrox


########################
##### COLOURS EDIT #####
########################
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"



###################################################
#################### FUNCTIONS ####################
###################################################

# Bye Ctrl+C
function ctrl_c(){
    echo -e "\n\n ${red}[!] Exit...${end}\n"
    tput cnorm && exit 1
}
trap ctrl_c INT

# Banner
print_banner(){
    echo;
	echo -e " ${yellow}     ____  ____  __  ___                                   __ ${end}"
	echo -e " ${yellow}    / __ \\/ __ \\/  |/  /  _________  ____ _   _____  _____/ /____  _____ ${end}"
	echo -e " ${yellow}   / / / / / / / /|_/ /  / ___/ __ \\/ __ \\ | / / _ \\/ ___/ __/ _ \\/ ___/ ${end}"
	echo -e " ${yellow}  / /_/ / /_/ / /  / /  / /__/ /_/ / / / / |/ /  __/ /  / /_/  __/ / ${end}"
	echo -e " ${yellow} /_____/\\____/_/  /_/   \___/\\____/_/ /_/|___/\\___/_/   \__/\\___/_/ ${end}\n\n"
	echo -e "  ${turquoise}Converts domain names to their corresponding IP address.${end}"
	echo -e "  ${turquoise}Version 1.0${end}"
    echo -e "  ${blue}Made by iTrox${end}\n"
}

# Main
main(){
	if [ $# -eq 0 ] || [ ! -f "$1" ]; then
	    echo -e " ${red}[!]${end} ${gray}Use:${end}${red} $0 <domain_list.txt>${end}"
		exit 1
	else
	    while IP= read -r subdomain;
        do
            ip=$(dig +short +retry=3 "$subdomain" | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort --unique) #| paste -sd "|" | sed 's/|/ | /g')
            echo -e "\n${green}[✔]${end} ${blue}$subdomain${end}"
			echo -e "$ip"

        done < "$1"
	
	fi
}



####################################################
#################### RUN SCRIPT ####################
####################################################
print_banner
main "$1"
