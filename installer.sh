#!/bin/bash
# A Menu driven veery service install shell script
######### Created by Dasun Hettiarachchi #########
######## 19th Jan 2017
##--------------------------------------------------
# DEFINE VARIABLES
#--------------------------------------------------=
. params.conf

RED='\033[0;31m'
NC='\033[0m' # No Color
BLACK='\033[0;30m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DRAKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'
EDITOR=vim
PASSWD=/etc/passwd
STD='\033[0;0;39m'
#--------------------------------------------------
# USER DEFINE FUNCTION
#-------------------------------------------------
show_spinner(){
sleep 3 & PID=$!
i=1
sp="/-\|"
echo -n ' '
while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done

}
show_banner(){
echo "Loading Configuration and Components...."
show_spinner
apt-get install -y toilet figlet >/dev/null
toilet -f bigmono9 -F gay facetone
}
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
main_one(){
 while true
do
 
        show_submenus
        read_sub_options
done

        pause
}
main_two(){
show_deploymentmenus
read_deployment_options
}
main_three(){
SET_CONFIG=1;
main_one;

}
deploy_choice_two(){
	show_deployserverno
	local choice
        read -p "Enter Choice " choice
        case $choice in
                1) install_qamodule 
		   install_appregistry
                   install_callbackservice
		install_interactions
		install_wallet		 
		install_fileservice
		install_cdrprocessor
		install_ardsmonitoring
		install_httpprogrammingapi
		install_voxboneapi
		install_eventservice
		install_fileservice
		install_resourceservice
		install_dashboardservice
		install_dashboard
		install_scheduleworker
		install_autoattendant
		install_eventmonitor
		install_limithandler
		install_liteticket
		install_userservice
		install_ardsliteroutingengine
		install_ardsliteservice
		install_todolistservice
		install_dynamicconfigurationgenerator
		   install_queuemusic ;;

		2) install_interactions
			install_cdrprocessor
		install_conference
		install_pbxservice
		install_cdrprocessor
		install_templates
		install_clusterconfiguration
		install_httpprogrammingapi
		install_fileservice
		install_integrationapi
		install_liteticket
		install_resourceservice
		install_ruleservice
		install_socialconnector
		install_sipuserendpointservice
		install_dynamicconfigurationgenerator
		install_notificationservice
		install_ardsliteservice
		install_phonenumbertrunkservice
		install_productivityservice
		install_monitorrestapi
		install_userservice ;;
                0) exit 0;;
                *) echo -e "${RED}Error....${STD}" && sleep2
        esac
}
deploy_choice_three(){
show_deployserverno
        local choice
        read -p "Enter Choice " choice
        case $choice in
                1) install_fileservice
                   install_queuemusic ;;
                2) install_fileservice 
	 	   install_queuemusic;; 
		3) install_userservice ;;
                0) exit 0;;
                *) echo -e "${RED}Error....${STD}" && sleep2
        esac 


}
deploy_choice_three(){
SERVER_CHOICE=3
	show_deployserverno
        read_deploymentserver_options

}
#deploy_servers(){
#	if [ $SERVER_CHOICE = 2] then;
#		if [ $DEPLOY_SERVER_NO = 1 ] then;
#			echo " 2 1"
#		fi
#		if [ $DEPLOY_SERVER_NO  2 ] then ;
#			echo " 2 3"
#		fi
#	elif [ $SERVER_CHOICE = 3 ] then;
#		if [ $DEPLOY_SERVER_NO = 1 ] then ;
#			echo " 3 1"
#		fi
#		if [ $DEPLOY_SERVER_NO = 2 ] then ;
#			echo " 3 2"
#		fi
#		if [ $DEPLOY_SERVER_NO = 3 ] then ;
#			echo " 3 3"
#		fi
#	fi	

#}
server_one(){
	clear
	echo "Deploying Servies on Single App Server...."
	show_spinner
	install_docker
	sleep 3
	install_nginx
	sleep 3
 	install_dynamicconfigurationgenerator;
	install_callbackservice;
	install_qamodule;
	install_appregistry;
	install_interactions;
	install_cdrgenerator;
	install_conference;
	install_pbxservice;
	install_cdrprocessor;
	install_ardsmonitoring;
	install_templates;
	install_clusterconfiguration;
	install_httpprogramming;
	install_queuemusic;
	install_voxboneapi;
	install_eventservice;
	install_fileservice;
	install_integrationapi;
	install_resourceservice;
	install_dashboardservice;
	install_scheduleworker;
	install_autoattendant;	
	install_eventmonitor;
	install_liteticket;
	install_httpprogrammingmonitorapi;
	install_ruleservice;
	install_monitorrestapi;
	install_userservice;
	install_socialsconnector;
	install_dashboard;
	install_sipuserendpointservice;
	install_limithandler;
	install_notificationservice;
	install_productivityservice;
	install_ardsliteroutingengine;
	install_ardsliteservice;
	install_phonenumbertrunkservice;
	install_todolistservice;
	install_wallet;
	pause
}

install_docker(){
clear
echo "Starting Docker installation"
which curl
sudo apt-get install curl -y
curl -sSL https://get.docker.com/ | sh
curl -sSL https://get.docker.com/gpg | sudo apt-key add -
echo "Docker Installation Completed"
}

install_nginx(){
clear
echo "Starting Nginx-Proxy Installation"
docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro -v /etc/localtime:/etc/localtime:ro --log-opt max-size=10m --log-opt max-file=10 jwilder/nginx-proxy
echo "Nginx-proxy Completed"
}

install_dynamicconfigurationgenerator(){
clear
echo -e "${CYAN}Starting dynamicconfigurationgenerator installation....${STD}" 
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-DynamicConfigurationGenerator" ]; then
		git clone git://github.com/DuoSoftware/DVP-DynamicConfigurationGenerator.git;
	fi
	cd DVP-DynamicConfigurationGenerator;
	docker build -t "dynamicconfigurationgenerator:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/dynamicconfigurationgenerator/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="SYS_FILESERVICE_HOST=fileservice.$FRONTEND" --env="SYS_FILESERVICE_PORT=8812" --env="SYS_FILESERVICE_VERSION=$HOST_VERSION"  --env="HOST_DYNAMICCONFIGGEN_PORT=8816" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="VIRTUAL_HOST=dynamicconfigurationgenerator.*" --env="LB_FRONTEND=dynamicconfigurationgenerator.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8816/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name dynamicconfigurationgenerator dynamicconfigurationgenerator node /usr/local/src/dynamicconfigurationgenerator/app.js;
echo -e "${CYAN}dynamicconfigurationgenerator installation Completed....${STD}"
sleep 3
}
install_fileservice(){
clear
echo "starting file service installation"
show_spinner	
	cd /usr/src/;
	if [ ! -d "DVP-FileService" ]; then
 	 # Control will enter here if $DIRECTORY exists.
		  git clone git://github.com/DuoSoftware/DVP-FileService.git;
	fi
	cd DVP-FileService;
	docker build -t "fileservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/fileservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_FILESERVICE_PORT=8812" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="SYS_COUCH_HOST=$COUCH_HOST" --env="SYS_COUCH_PORT=$COUCH_PORT" --env="VIRTUAL_HOST=fileservice.*" --env="LB_FRONTEND=fileservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8812/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name fileservice fileservice node /usr/local/src/fileservice/app.js;
echo "File service installation completed";	
sleep 3
}
install_resourceservice(){
clear 
echo "Starting Resource Service Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-ResourceService" ]; then
		git clone git://github.com/DuoSoftware/DVP-ResourceService.git;
	fi

	cd DVP-ResourceService;
	docker build -t "resourceservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/resourceservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_RESOURCESERVICE_PORT=8831" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="SYS_DASHBOARD_REDIS_HOST=$DASHBOARD_REDIS_HOST" --env="SYS_DASHBOARD_REDIS_PORT=$DASHBOARD_REDIS_PORT" --env="SYS_DASHBOARD_REDIS_PASSWORD=$DASHBOARD_REDIS_PASSWORD" --env="SYS_REDIS_DB_DASHBOARD=$REDIS_DB_DASHBOARD" --env="VIRTUAL_HOST=resourceservice.*" --env="LB_FRONTEND=resourceservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8831/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name resourceservice resourceservice node /usr/local/src/resourceservice/app.js;
echo "Resource Service Installation Completed"
sleep 3
}
install_ardsmonitoring(){
clear
echo "Starting ARDSMonitoring Service Installation" 
	cd /usr/src/;
	if [ ! -d "DVP-ARDSMonitoring" ]; then
		git clone git://github.com/DuoSoftware/DVP-ARDSMonitoring.git;
	fi

	cd DVP-ARDSMonitoring;
	docker build -t "ardsmonitoring:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/ardsmonitoring/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_ARDSMONITOR_PORT=8830" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="SYS_ARDSLITEROUTINGENGINE_HOST=ardsliteroutingengine.$FRONTEND" --env="SYS_ARDSLITEROUTINGENGINE_PORT=8835" --env="SYS_ARDSLITEROUTINGENGINE_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="VIRTUAL_HOST=ardsmonitoring.*" --env="LB_FRONTEND=ardsmonitoring.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8830/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name ardsmonitoring ardsmonitoring node /usr/local/src/ardsmonitoring/app.js;
echo "ARDSMonitoring Service Installation Completed"
sleep 3
}
install_phonenumbertrunkservice(){
clear
echo "Starting PhoneNumberTrunkService Installation"	
show_spinner	
	cd /usr/src/;
	if [ ! -d "DVP-PhoneNumberTrunkService" ]; then
		git clone git://github.com/DuoSoftware/DVP-PhoneNumberTrunkService.git;
	fi

	cd DVP-PhoneNumberTrunkService;
	docker build -t "phonenumbertrunkservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/phonenumbertrunkservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_PHONENUMBERTRUNKSERVICE_PORT=8818" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="VIRTUAL_HOST=phonenumbertrunkservice.*" --env="LB_FRONTEND=phonenumbertrunkservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8818/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name phonenumbertrunkservice phonenumbertrunkservice node /usr/local/src/phonenumbertrunkservice/app.js;
echo "PhoneNumberTrunkService Installation Completed"
sleep 3

}
install_limitehandler(){
clear
echo "Starting LimiteHandler Service Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-LimitHandler" ]; then
		git clone git://github.com/DuoSoftware/DVP-LimitHandler.git;
	fi

	cd DVP-LimitHandler;
	docker build -t "limithandler:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/limithandler/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_LIMITHANDLER_PORT=8815" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="VIRTUAL_HOST=limithandler.*" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="LB_FRONTEND=limithandler.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_NOTIFICATIONSERVICE_HOST=notificationservice.$FRONTEND" --env="SYS_NOTIFICATIONSERVICE_VERSION=$HOST_VERSION" --env="SYS_USERSERVICE_HOST=userservice.$FRONTEND" --env="SYS_USERSERVICE_VERSION=$HOST_VERSION" --env="SYS_APPREGISTRY_HOST=appregistry.$FRONTEND" --env="SYS_APPREGISTRY_VERSION=$HOST_VERSION" --expose=8815/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name limithandler limithandler node /usr/local/src/limithandler/app.js;
echo "LimitHandler Installation Completed"
sleep 3
}
install_ardsliteroutingengine(){
clear
echo "Starting ARDSLiteRoutingEngine Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-ARDSLiteRoutingEngine" ]; then
		git clone git://github.com/DuoSoftware/DVP-ARDSLiteRoutingEngine.git;
	fi

	cd DVP-ARDSLiteRoutingEngine;
	docker build -t "ardsliteroutingengine:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="GO_CONFIG_DIR=/go/src/github.com/DuoSoftware/DVP-ARDSLiteRoutingEngine/ArdsLiteRoutingEngine" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_REDIS_DB_LOCATION=$REDIS_DB_LOCATION" --env="HOST_ARDSLITEROUTINGENGINE_PORT=8835" --env="HOST_IP=$HOST_IP"  --env="HOST_VERSION=$HOST_VERSION" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="VIRTUAL_HOST=ardsliteroutingengine.*" --env="LB_FRONTEND=ardsliteroutingengine.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_RABBITMQ_HOST=$RABBITMQ_HOST" --env="SYS_RABBITMQ_PORT=$RABBITMQ_PORT" --env="SYS_RABBITMQ_USER=$RABBITMQ_USER" --env="SYS_RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD" --expose=8835/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name ardsliteroutingengine ardsliteroutingengine go run *.go;
echo "ARDSLiteRoutingEngine Installation Completed"
sleep 3
}
install_notificationservice(){
clear
echo "Starting NotificationService Intallation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-NotificationServicee" ]; then
		git clone git://github.com/DuoSoftware/DVP-NotificationService.git;
	fi

	cd DVP-NotificationService;
	docker build -t "notificationservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/notificationservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_NOTIFICATIONSERVICE_PORT=8833" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="VIRTUAL_HOST=notificationservice.*" --env="LB_FRONTEND=notificationservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8833/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name notificationservice notificationservice node /usr/local/src/notificationservice/app.js;
echo "Notification Service Installation Completed"
sleep 3
}
install_engagementservice(){
clear
echo "Starting EngagementService Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-Engagement" ]; then
		git clone git://github.com/DuoSoftware/DVP-Engagement.git;
	fi

	cd DVP-Engagement;
	docker build -t "engagementservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/engagementservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_ENGAGEMENTSERVICE_PORT=8834" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD" --env="VIRTUAL_HOST=engagementservice.*" --env="LB_FRONTEND=engagementservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8834/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name engagementservice engagementservice node /usr/local/src/engagementservice/app.js;
echo "EngagementSerive Installation Completed"
sleep 3
}
install_pbxservice(){
clear
echo "Starting PBXService Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-PBXService" ]; then
		git clone git://github.com/DuoSoftware/DVP-PBXService.git;
	fi

	cd DVP-PBXService;
	docker build -t "pbxservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/pbxservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_PBXSERVICE_PORT=8820" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="SYS_SIPUSERSERVICE_HOST=sipuserendpointservice.$FRONTEND" --env="SYS_SIPUSERSERVICE_NODE_CONFIG_DIR=/usr/local/src/sipuserendpointservice/config" --env="SYS_SIPUSERSERVICE_PORT=8814"  --env="SYS_SIPUSERSERVICE_VERSION=$HOST_VERSION" --env="SYS_FILESERVICE_HOST=fileservice.$FRONTEND" --env="SYS_FILESERVICE_NODE_CONFIG_DIR=/usr/local/src/fileservice/config" --env="SYS_FILESERVICE_PORT=8812" --env="SYS_FILESERVICE_VERSION=$HOST_VERSION" --env="VIRTUAL_HOST=pbxservice.*" --env="LB_FRONTEND=pbxservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8820/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name pbxservice pbxservice node /usr/local/src/pbxservice/app.js;
echo "PBXService Installation Completed"
sleep 3
}
install_callbackservice(){
clear
echo "Starting CallBackService Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-CallBackService" ]; then
		git clone git://github.com/DuoSoftware/DVP-CallBackService.git;
	fi

	cd DVP-CallBackService;
	docker build -t "callbackservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="GO_CONFIG_DIR=/go/src/github.com/DuoSoftware/DVP-CallBackService/CallbackServer" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_CALLBACKSERVICE_PORT=8840" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="SYS_CAMPAIGNMANAGER_HOST=campaignmanager.$FRONTEND" --env="SYS_CAMPAIGNMANAGER_NODE_CONFIG_DIR=/usr/local/src/campaignmanager/config" --env="SYS_CAMPAIGNMANAGER_PORT=8827" --env="VIRTUAL_HOST=callbackservice.*" --env="LB_FRONTEND=callbackservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8840/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name callbackservice callbackservice go run *.go;
echo "CallBackService Installation Completed"
sleep 3
}
install_voxboneapi(){
clear
echo  "Starting VoxBoneAPI Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-VoxboneAPI" ]; then
		git clone git://github.com/DuoSoftware/DVP-VoxboneAPI.git;
	fi

	cd DVP-VoxboneAPI;
	docker build -t "voxboneapi:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/voxboneapi/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_VERSION=$HOST_VERSION" --env="VOXBONE_URL=https://sandbox.voxbone.com/ws-voxbone/services/rest" --env="HOST_VOXBONEAPI_PORT=8832" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="SYS_PHONENUMBERTRUNKSERVICE_HOST=phonenumbertrunkservice.$FRONTEND" --env="SYS_PHONENUMBERTRUNKSERVICE_NODE_CONFIG_DIR=/usr/local/src/phonenumbertrunkservice/config" --env="SYS_PHONENUMBERTRUNKSERVICE_PORT=8818" --env="SYS_LIMITHANDLER_HOST=limithandler.$FRONTEND" --env="SYS_LIMITHANDLER_NODE_CONFIG_DIR=/usr/local/src/limithandler/config" --env="SYS_LIMITHANDLER_PORT=8815" --env="SYS_BILLINGSERVICE_HOST=billingservice.$FRONTEND" --env="SYS_BILLINGSERVICE_PORT=$LB_PORT" --env="SYS_BILLINGSERVICE_VERSION=$HOST_VERSION" --env="SYS_WALLETSERVICE_HOST=walletservice.$FRONTEND" --env="SYS_WALLETSERVICE_PORT=$LB_PORT" --env="SYS_WALLETSERVICE_VERSION=$HOST_VERSION" --env="VOXBONE_URL=$VOX_URL" --env="VOX_APIKEY=$VOX_KEY" --env="VIRTUAL_HOST=voxboneapi.*" --env="LB_FRONTEND=voxboneapi.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8832/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name voxboneapi voxboneapi node /usr/local/src/voxboneapi/app.js;
echo "VoxBoneAPI Installation Completed"
sleep 3
}
install_ruleservice(){
clear
echo "Starting RuleService Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-RuleService" ]; then
		git clone git://github.com/DuoSoftware/DVP-RuleService.git;
	fi

	cd DVP-RuleService;
	docker build -t "ruleservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/ruleservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_RULESERVICE_PORT=8817" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="VIRTUAL_HOST=ruleservice.*" --env="LB_FRONTEND=ruleservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8817/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name ruleservice ruleservice node /usr/local/src/ruleservice/app.js;
echo "RuleService Installation Completed"
sleep 3

}
install_conference(){
clear
echo "Starting Conference Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-Conference" ]; then
		git clone git://github.com/DuoSoftware/DVP-Conference.git;
	fi

	cd DVP-Conference;
	docker build -t "conference:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/conference/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_NOTIFICATIONSERVICE_HOST=notificationservice.$FRONTEND" --env="SYS_NOTIFICATIONSERVICE_PORT=8833" --env="HOST_NAME=conference" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_CONFERENCE_PORT=8821" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="VIRTUAL_HOST=conference.*" --env="LB_FRONTEND=conference.$FRONTEND" --env="LB_PORT=LB_PORT" --expose 8821 --log-opt max-size=10m --log-opt max-file=10 --restart=always --name conference conference node /usr/local/src/conference/app.js;
echo "Conference Installation Completed"
sleep 3
}
install_interactions(){
clear
echo "Starting Interactions Service Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-Interactions" ]; then
		git clone git://github.com/DuoSoftware/DVP-Interactions.git;
	fi

	cd DVP-Interactions;
	docker build -t "interactions:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/interactions/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_INTERACTIONS_PORT=8873" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="VIRTUAL_HOST=interactions.*" --env="LB_FRONTEND=interactions.$FRONTEND" --env="LB_PORT=LB_PORT" --env="SYS_RESOURCESERVICE_HOST=resourceservice.$FRONTEND" --env="SYS_RESOURCESERVICE_PORT=8831" --env="SYS_RESOURCESERVICE_VERSION=$HOST_VERSION" --env="SYS_SIPUSERENDPOINTSERVICE_HOST=sipuserendpointservice.$FRONTEND" --env="SYS_SIPUSERENDPOINTSERVICE_PORT=8814" --env="SYS_SIPUSERENDPOINTSERVICE_VERSION=$HOST_VERSION" --env="SYS_CLUSTERCONFIG_HOST=clusterconfig.$FRONTEND" --env="SYS_CLUSTERCONFIG_PORT=8805" --env="SYS_CLUSTERCONFIG_VERSION=$HOST_VERSION" --expose=8873/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name interactions interactions node /usr/local/src/interactions/app.js
echo "Interaction Service Installation Completed"
sleep 3
}
install_templates(){
clear
echo "Starting Template Service Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-Templates" ]; then
		git clone git://github.com/DuoSoftware/DVP-Templates.git
	fi

	cd DVP-Templates;
	docker build -t "templates:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/templates/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_TEMPLATE_PORT=8875" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT"   --env="VIRTUAL_HOST=templates.*" --env="LB_FRONTEND=templates.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8875/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name templates templates node /usr/local/src/templates/app.js;
echo "Template Service Installation Completed"
sleep 3
}
install_ardsliteservice(){
clear
echo "Starting ARDSLiteService Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-ARDSLiteService" ]; then
		git clone git://github.com/DuoSoftware/DVP-ARDSLiteService.git;
	fi

	cd DVP-ARDSLiteService;
	docker build -t "ardsliteservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/ardsliteservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_ARDSLITESERVICE_PORT=8828" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="SYS_ARDSLITEROUTINGENGINE_HOST=ardsliteroutingengine.$FRONTEND" --env="SYS_ARDSLITEROUTINGENGINE_GO_CONFIG_DIR=/go/src/github.com/DuoSoftware/DVP-ARDSLiteRoutingEngine/ArdsLiteRoutingEngine" --env="SYS_ARDSLITEROUTINGENGINE_PORT=8835" --env="SYS_RESOURCESERVICE_HOST=resourceservice.$FRONTEND" --env="SYS_RESOURCESERVICE_PORT=8831" --env="SYS_RESOURCESERVICE_VERSION=$HOST_VERSION" --env="VIRTUAL_HOST=ardsliteservice.*" --env="LB_FRONTEND=ardsliteservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_RABBITMQ_HOST=$RABBITMQ_HOST" --env="SYS_RABBITMQ_PORT=$RABBITMQ_PORT" --env="SYS_RABBITMQ_USER=$RABBITMQ_USER" --env="SYS_RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD" --expose=8828/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name ardsliteservice ardsliteservice node /usr/local/src/ardsliteservice/app.js;
echo "ARDSLite Service Installation Completd"
sleep 3
}
install_userservice(){
clear
echo "Starting UserService Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-UserService" ]; then
		git clone git://github.com/DuoSoftware/DVP-UserService.git;
	fi
	cd DVP-UserService;
	docker build -t "userservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env='NODE_CONFIG_DIR=/usr/local/src/userservice/config' --env="HOST_TOKEN=$HOST_TOKEN" --env="ACTIVE_TENANT=$TENANT" --env="HOST_USERSERVICE_PORT=8842" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="VIRTUAL_HOST=userservice.*" --env="LB_FRONTEND=userservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_RESOURCESERVICE_HOST=resourceservice.$FRONTEND" --env="SYS_RESOURCESERVICE_PORT=8831" --env="SYS_RESOURCESERVICE_VERSION=$HOST_VERSION" --env="SYS_SIPUSERENDPOINTSERVICE_HOST=sipuserendpointservice.$FRONTEND" --env="SYS_SIPUSERENDPOINTSERVICE_PORT=8814" --env="SYS_SIPUSERENDPOINTSERVICE_VERSION=$HOST_VERSION" --env="SYS_CLUSTERCONFIG_HOST=clusterconfig.$FRONTEND" --env="SYS_CLUSTERCONFIG_PORT=8805" --env="SYS_CLUSTERCONFIG_VERSION=$HOST_VERSION" --env="FACEBOOK_CLIENT_SECRET=$FACEBOOK_PWD" --env="FOURSQUARE_CLIENT_SECRET=$FOURSQUARE_PWD" --env="GOOGLE_CLIENT_SECRET=$GOOGLE_PWD" --env="GITHUB_CLIENT_SECRET=$GITHUB_PWD" --env="INSTAGRAM_CLIENT_SECRET=$INSTAGRAM_PWD" --env="LINKEDIN_CLIENT_SECRET=$LINKEDIN_PWD" --env="TWITCH_CLIENT_SECRET=$TWITCH_PWD" --env="MICROSOFT_CLIENT_SECRET=$WINDOWS_PWD" --env="YAHOO_CLIENT_SECRET=$YAHOO_PWD" --env="BITBUCKET_CLIENT_SECRET=$BITBUCKET_PWD" --env="SPOTIFY_CLIENT_SECRET=$SPOTIFY_PWD" --env="TWITTER_CLIENT_KEY=$TWITTER_KEY" --env="TWITTER_CLIENT_SECRET=$TWITTER_PWD" --env="LOGIN_VERIFICATION_REQUIRE=$LOGIN_VERIFICATION" --env="SIGNUP_VERIFICATION_REQUIRE=$SIGNUP_VERIFICATION" --env="GOOGLE_RECAPTCHA_KEY=$GOOGLE_RECAPTCHA_KEY" --env="SYS_APP_UI_HOST=$APP_UI_HOST" --env="SYS_BILLINGSERVICE_HOST=billingservice.$FRONTEND" --env="SYS_BILLINGSERVICE_PORT=$LB_PORT" --env="SYS_BILLINGSERVICE_VERSION=$HOST_VERSION" --expose=8842/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name userservice userservice node /usr/local/src/userservice/app.js
echo "Userservice Installation Completed"
sleep 3
}
install_monitorrestapi(){
clear
echo "Starting MonitorRestAPI Installation"
show_spinner
cd /usr/src/;
	if [ ! -d "DVP-MonitorRestAPI" ]; then
		git clone git://github.com/DuoSoftware/DVP-MonitorRestAPI.git;
	fi

	cd DVP-MonitorRestAPI;
	docker build -t "monitorrestapi:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/monitorrestapi/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_MONITORRESTAPI_PORT=8823" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="VIRTUAL_HOST=monitorrestapi.*" --env="LB_FRONTEND=monitorrestapi.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8823/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name monitorrestapi monitorrestapi node /usr/local/src/monitorrestapi/app.js;
echo "MonitorRestAPI Installation Completed"
sleep3
}
install_httpprogrammingapi(){
clear
echo "Starting HTTPProgrammingAPI Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-HTTPProgrammingAPI" ]; then
		git clone git://github.com/DuoSoftware/DVP-HTTPProgrammingAPI.git;
	fi

	cd DVP-HTTPProgrammingAPI;
	docker build -t "httpprogrammingapi:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/httpprogrammingapi/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_FREESWITCH_HOST=$FREESWITCH_HOST"  --env="SYS_EVENTSOCKET_PORT=$EVENTSOCKET_PORT" --env="FS_PASSWORD=$FREESWITCH_EVENTSOCKET_PASSWORD" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="HOST_HTTPPROGRAMMINGAPI_PORT=8807" --env="SYS_FILESERVICE_HOST=fileservice.$FRONTEND" --env="SYS_FILESERVICE_NODE_CONFIG_DIR=/usr/local/src/fileservice/config" --env="SYS_FILESERVICE_PORT=8812" --env="SYS_FILESERVICE_VERSION=$HOST_VERSION" --env="SYS_DOWNLOAD_FILESERVICE_HOST=fileservice.$FRONTEND" --env="SYS_DOWNLOAD_FILESERVICE_PORT=8812" --env="SYS_DOWNLOAD_FILESERVICE_VERSION=$HOST_VERSION" --env="SYS_RULESERVICE_HOST=$RULESERVICE_HOST" --env="SYS_RULESERVICE_PORT=8817" --env="SYS_RULESERVICE_VERSION=ruleservice.$FRONTEND" --env="SYS_ARDSLITESERVICE_HOST=ardsliteservice.$FRONTEND" --env="SYS_ARDSLITESERVICE_NODE_CONFIG_DIR=/usr/local/src/ardsliteservice/config" --env="SYS_ARDSLITESERVICE_PORT=8828" --env="SYS_QUEUEMUSIC_HOST=queuemusic.$FRONTEND" --env="SYS_QUEUEMUSIC_PORT=8842" --env="SYS_QUEUEMUSIC_VERSION=$HOST_VERSION" --env="SYS_INTERACTION_HOST=interactions.$FRONTEND" --env="SYS_INTERACTION_PORT=8873" --env="SYS_INTERACTION_VERSION=$HOST_VERSION" --env="SYS_TICKET_HOST=liteticket.$FRONTEND" --env="SYS_TICKET_PORT=8872" --env="SYS_TICKET_VERSION=1.0.0.0" --env="VIRTUAL_HOST=httpprogrammingapi.*" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="LB_FRONTEND=httpprogrammingapi.$FRONTEND" --env="SYS_CSAT_HOST=csatservice.$FRONTEND" --env="SYS_CSAT_PORT:8883" --env="SYS_CSAT_VERSION=$HOST_VERSION" --env="LB_PORT=$LB_PORT" --expose=8807/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name httpprogrammingapi httpprogrammingapi node /usr/local/src/httpprogrammingapi/app.js;
echo "HTTProgrammingAPI Installation Completed"
sleep 3
}
install_sipuserendpointservice(){
clear
echo "Starting SipUserEndpointService Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-SIPUserEndpointService" ]; then
		git clone git://github.com/DuoSoftware/DVP-SIPUserEndpointService.git;
	fi
	cd DVP-SIPUserEndpointService;
	docker build -t "sipuserendpointservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/sipuserendpointservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="HOST_SIPUSERENDPOINTSERVICE_PORT=8814" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_LBDATABASE_MYSQL_USER=$LBDATABASE_MYSQL_USER" --env="SYS_LBDATABASE_MYSQL_PASSWORD=$LBDATABASE_MYSQL_PASSWORD" --env="SYS_LBDATABASE_HOST=$LBDATABASE_HOST" --env="SYS_LBDATABASE_TYPE=$LBDATABASE_TYPE" --env="SYS_LBMYSQL_PORT=$LBMYSQL_PORT" --env="SYS_LBDATABASE_MYSQL_DB=$LBDATABASE_MYSQL_DB" --env="VIRTUAL_HOST=sipuserendpointservice.*" --env="LB_FRONTEND=sipuserendpointservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8814/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name sipuserendpointservice sipuserendpointservice node /usr/local/src/sipuserendpointservice/app.js;
echo "SipUserEndpointService Installation"
sleep 3
}
install_clusterconfig(){
clear
echo "Starting ClusterConfig Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-ClusterConfiguration" ]; then
		git clone git://github.com/DuoSoftware/DVP-ClusterConfiguration.git;
	fi
	cd DVP-ClusterConfiguration;
	docker build -t "clusterconfig:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/clusterconfiguration/config" --env="HOST_CLUSTERCONFIGURATION_PORT=8805" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_CONFIG=$REDIS_DB_CONFIG" --env="VIRTUAL_HOST=clusterconfig.*" --env="LB_FRONTEND=clusterconfig.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8805/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name clusterconfig clusterconfig node /usr/local/src/clusterconfiguration/app.js;
echo "ClusterConfig Installation Completed"
sleep 3
}
install_eventmonitor(){
clear
echo "Starting EventMonitor Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-EventMonitor" ]; then
		git clone git://github.com/DuoSoftware/DVP-EventMonitor.git;
	fi
	cd DVP-EventMonitor;
	docker build -t "eventmonitor:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/eventmonitor/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_EVENTMONITOR_PORT=8806" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=DuoS123" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_PROCESSEDCDR=$REDIS_DB_PROCESSEDCDR" --env="SYS_ARDSLITESERVICE_HOST=ardsliteservice.$FRONTEND" --env="SYS_ARDSLITESERVICE_NODE_CONFIG_DIR=/usr/local/src/ardsliteservice/config" --env="SYS_ARDSLITESERVICE_PORT=8828" --env="SYS_ARDSLITESERVICE_VERSION=$HOST_VERSION" --env="SYS_DIALER_HOST=dialerapi.$FRONTEND" --env="SYS_DIALER_GO_CONFIG_DIR=/go/src/github.com/DuoSoftware/DVP-DialerAPI/DuoDialer" --env="SYS_DIALER_PORT=8836" --env="SYS_NOTIFICATIONSERVICE_HOST=notificationservice.$FRONTEND" --env="SYS_NOTIFICATIONSERVICE_PORT=8833" --env="SYS_INTERACTIONS_HOST=interactions.$FRONTEND" --env="SYS_INTERACTIONS_VERSION=$HOST_VERSION" --env="SYS_FREESWITCH_HOST=$FREESWITCH_HOST" --env="SYS_FREESWITCH_EVENTSOCKET_PASSWORD=$FREESWITCH_EVENTSOCKET_PASSWORD" --env="SYS_XMLRPC_PORT=$XMLRPC_PORT" --env="SYS_EVENTSOCKET_PORT=$EVENTSOCKET_PORT" --env="VIRTUAL_HOST=eventmonitor.*" --env="LB_FRONTEND=eventmonitor.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8806/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name eventmonitor eventmonitor node /usr/local/src/eventmonitor/app.js;
echo "EventMonitor Installation Completed"
sleep 3
}
install_queuemusic(){
clear
echo "Starting QueueMusic Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-QueueMusic" ]; then
		git clone git://github.com/DuoSoftware/DVP-QueueMusic.git;
	fi
	cd DVP-QueueMusic;
	docker build -t "queuemusic:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/queuemusic/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="HOST_NAME=queuemusic" --env="HOST_QUEUEMUSIC_PORT=8843" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="VIRTUAL_HOST=queuemusic.*" --env="LB_FRONTEND=queuemusic.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8843/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name queuemusic queuemusic node /usr/local/src/queuemusic/app.js;
echo "QueueMusic Installation Completed"
sleep 3	
}
install_appregistry(){
clear
echo "Starting APPRegistry Service Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-APPRegistry" ]; then
		git clone git://github.com/DuoSoftware/DVP-APPRegistry.git;
	fi
	cd DVP-APPRegistry;
	docker build -t "appregistry:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/appregistry/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="HOST_APPREGISTRY_PORT=8811" --env="HOST_IP=$HOST_IP" --env="HOST_VERSION=$HOST_VERSION" --env="VIRTUAL_HOST=appregistry.*" --env="LB_FRONTEND=appregistry.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8811/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name appregistry appregistry node /usr/local/src/appregistry/app.js;
echo "APPRegistry Service Installation Completed"
sleep 3
}
install_autoattendant(){
clear
echo "Starting AutoAttendant Service Installtion.."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-AutoAttendant" ]; then
		git clone git://github.com/DuoSoftware/DVP-AutoAttendant.git;
	fi
	cd DVP-AutoAttendant;
	docker build -t "autoattendant:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/autoattendant/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT"  --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_AUTOATTENDANT_PORT=8824" --env="VIRTUAL_HOST=autoattendant.*" --env="LB_FRONTEND=autoattendant.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8824/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name autoattendant autoattendant node /usr/local/src/autoattendant/app.js;
echo "AutoAttendant Service Installation Completed"
sleep 3
}
install_dashboard(){
clear
echo "Starting Dashboard Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-DashBoard" ]; then
		git clone git://github.com/DuoSoftware/DVP-DashBoard.git
	fi	

	cd DVP-DashBoard;
	docker build -t "dashboard:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="GO_CONFIG_DIR=/go/src/github.com/DuoSoftware/DVP-DashBoard" --env="HOST_TOKEN=$HOST_TOKEN" --env="SYS_DASHBOARD_REDIS_HOST=$DASHBOARD_REDIS_HOST" --env="SYS_DASHBOARD_REDIS_PORT=$DASHBOARD_REDIS_PORT" --env="SYS_DASHBOARD_REDIS_PASSWORD=$DASHBOARD_REDIS_PASSWORD" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_DASHBOARD_PORT=8841" --env="HOST_DASHBOARD_CACHE=$DASHBOARD_CACHE_TYPE" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_DASHBOARD=$REDIS_DB_DASHBOARD" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="SYS_STATSD_HOST=$STATSD_HOST" --env="SYS_STATSD_PORT=$STATSD_PORT" --env="VIRTUAL_HOST=dashboard.*" --env="LB_FRONTEND=dashboard.$FRONTEND" --env="LB_PORT=80" --expose=8841/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name dashboard dashboard go run *.go
echo "Dashboard Installation Completed"
sleep 3
}
install_cdrprocessor(){
clear
echo "Starting CDRProcessor Installation.."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-CDRProcessor" ]; then
		git clone git://github.com/DuoSoftware/DVP-CDRProcessor.git;
	fi

	cd DVP-CDRProcessor;
	docker build -t "cdrprocessor:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/cdrprocessor/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_CDRPROCESSOR_PORT=8809" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_FILESERVICE_HOST=fileservice.$FRONTEND" --env="SYS_FILESERVICE_PORT=$LB_PORT" --env="SYS_FILESERVICE_VERSION=$HOST_VERSION" --env="VIRTUAL_HOST=cdrprocessor.*" --env="LB_FRONTEND=cdrprocessor.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8809/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name cdrprocessor cdrprocessor node /usr/local/src/cdrprocessor/app.js;
echo "CDRProcessor Installation Completed"
sleep 3	
}
install_eventservice(){
clear
echo "Starting EventService Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-EventService" ]; then
		git clone git://github.com/DuoSoftware/DVP-EventService.git
	fi

	cd DVP-EventService;
	docker build -t "eventservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env='NODE_CONFIG_DIR=/usr/local/src/eventservice/config' --env="HOST_EVENTSERVICE_PORT=8822" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_RABBITMQ_HOST=$RABBITMQ_HOST" --env="SYS_RABBITMQ_PORT=$RABBITMQ_PORT" --env="SYS_RABBITMQ_USER=$RABBITMQ_USER" --env="SYS_RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD" --env="VIRTUAL_HOST=eventservice.*" --env="LB_FRONTEND=eventservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8822/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name eventservice eventservice node /usr/local/src/eventservice/app.js
echo "EventService Installation Completed"
sleep 3
}
install_liteticket(){
clear
echo "Starting LiteTicket Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-LiteTicket" ]; then
		git clone git://github.com/DuoSoftware/DVP-LiteTicket.git
	fi

	cd DVP-LiteTicket;
	docker build -t "liteticket:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/liteticket/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_LITETICKET_PORT=8872" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="SYS_DASHBOARD_REDIS_HOST=$DASHBOARD_REDIS_HOST" --env="SYS_DASHBOARD_REDIS_PORT=$DASHBOARD_REDIS_PORT" --env="SYS_DASHBOARD_REDIS_PASSWORD=$DASHBOARD_REDIS_PASSWORD" --env="SYS_REDIS_DB_DASHBOARD=$REDIS_DB_DASHBOARD" --env="SYS_RABBITMQ_HOST=$RABBITMQ_HOST" --env="SYS_RABBITMQ_PORT=$RABBITMQ_PORT" --env="SYS_RABBITMQ_USER=$RABBITMQ_USER" --env="SYS_RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD" --env="VIRTUAL_HOST=liteticket.*" --env="LB_FRONTEND=liteticket.$FRONTEND"  --env="LB_PORT=$LB_PORT" --env="SYS_RESOURCESERVICE_HOST=resourceservice.$FRONTEND"  --env="SYS_RESOURCESERVICE_PORT=8831" --env="SYS_RESOURCESERVICE_VERSION=$HOST_VERSION" --env="SYS_SIPUSERENDPOINTSERVICE_HOST=sipuserendpointservice.$FRONTEND"  --env="SYS_SIPUSERENDPOINTSERVICE_PORT=8814" --env="SYS_SIPUSERENDPOINTSERVICE_VERSION=$HOST_VERSION" --env="SYS_CLUSTERCONFIG_HOST=clusterconfig.$FRONTEND"  --env="SYS_CLUSTERCONFIG_PORT=8805" --env="SYS_CLUSTERCONFIG_VERSION=$HOST_VERSION" --env="SYS_ARDSLITESERVICE_HOST=ardsliteservice.$FRONTEND"  --env="SYS_ARDSLITESERVICE_PORT=8828" --env="SYS_ARDSLITESERVICE_VERSION=$HOST_VERSION" --env="SYS_NOTIFICATIONSERVICE_HOST=notificationservice.$FRONTEND"  --env="SYS_NOTIFICATIONSERVICE_PORT=8833" --env="SYS_NOTIFICATIONSERVICE_VERSION=$HOST_VERSION" --env="SYS_SCHEDULEWORKER_HOST=scheduleworker.$FRONTEND"  --env="SYS_SCHEDULEWORKER_PORT=8852" --env="SYS_SCHEDULEWORKER_VERSION=$HOST_VERSION" --env="SYS_INTERACTIONS_HOST=interactions.$FRONTEND" --env="SYS_INTERACTIONS_VERSION=$HOST_VERSION" --expose=8872/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name liteticket liteticket node /usr/local/src/liteticket/app.js
echo "LiteTicket Installation Completed"
sleep 3
}
install_scheduleworker(){
clear
echo "Starting ScheduleWorker Service Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-ScheduleWorker" ]; then
		git clone git://github.com/DuoSoftware/DVP-ScheduleWorker.git
	fi
	cd DVP-ScheduleWorker;
	docker build -t "scheduleworker:latest" .;
	cd /usr/src/;
	docker run -d -t--memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/scheduleworker/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_SCHEDULEWORKER_PORT=8852" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="VIRTUAL_HOST=scheduleworker.*" --env="LB_FRONTEND=scheduleworker.$FRONTEND"  --env="LB_PORT=$LB_PORT" --expose=8852/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name scheduleworker scheduleworker node /usr/local/src/scheduleworker/app.js
echo "ScheduleWorker Service Installation Completed"
sleep 3
}
install_cdrgenerator(){
clear
echo "Starting CDRGenerator Installtion..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-CDRGenerator" ]; then
		git clone git://github.com/DuoSoftware/DVP-CDRGenerator.git;
	fi

	cd DVP-CDRGenerator;
	docker build -t "cdrgenerator:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/cdrgenerator/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_CDRGENERATOR_PORT=8859" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_PROCESSCDR=$REDIS_DB_PROCESSCDR" --env="VIRTUAL_HOST=cdrgenerator.*" --env="LB_FRONTEND=cdrgenerator.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8859/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name cdrgenerator cdrgenerator node /usr/local/src/cdrgenerator/app.js;
echo "CDRGenerator Installation Completed"
sleep 3
}
install_productivityservice(){
clear
echo "Starting ProductivityService Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-ProductivityService" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone git://github.com/DuoSoftware/DVP-ProductivityService.git;
	fi
	cd DVP-ProductivityService;
	docker build -t "productivityservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/productivityservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_PRODUCTIVITYSERVICE_PORT=8876" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_DASHBOARD=$REDIS_DB_DASHBOARD" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="VIRTUAL_HOST=productivityservice.*" --env="LB_FRONTEND=productivityservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8876/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name productivityservice productivityservice node /usr/local/src/productivityservice/app.js;
echo "ProductivityService Installation Completed"
sleep 3
}
install_mailreceiver(){
clear
echo "Starting MailReceiver Installation"
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-MailReceiver" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone git://github.com/DuoSoftware/DVP-MailReceiver.git;
	fi
	cd DVP-MailReceiver;
	docker build -t "mailreceiver:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/mailreceiver/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_MAILRECEIVER_PORT=8877" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_ENABLE_SMTPLISTNER=true" --env="HOST_ENABLE_SMTPSENDER=true" --env="HOST_ENABLE_SMSSENDER=true" --env="HOST_ENABLE_IMAPLISTNER=true" --env="HOST_NAME=mailreceiver.$FRONTEND" --env="SYS_SERVER_ID=" --env="SYS_CALLBACK_OPTION=GET" --env="SYS_REQUEST_TYPE=CALL" --env="SYS_SERVER_ID=2" --env="SYS_RESOURCE_TYPE=cluster" --env="SYS_EMAIL_QUEUE_NAME=EMAILOUT" --env="SYS_SMS_QUEUE_NAME=SMSOUT" --env="SYS_SMTP_LISTNER=true" --env="SYS_SMTP_SENDER=true" --env="SYS_SMS_SENDER=true" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD" --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="SYS_RABBITMQ_HOST=$RABBITMQ_HOST" --env="SYS_RABBITMQ_PORT=$RABBITMQ_PORT" --env="SYS_RABBITMQ_USER=$RABBITMQ_USER" --env="SYS_RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD" --env="SYS_SMSSERVER_HOST=$SMS_SERVER" --env="SYS_SMSSERVER_PORT=$SMS_PORT" --env="SYS_SMSSERVER_PASSWORD=$SMS_PASSWORD" --env="SYS_SMSSERVER_USER=$SMS_USER" --env="VIRTUAL_HOST=mailreceiver.*" --env="LB_FRONTEND=mailreceiver.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="IMAP_USER_NAME=duodemouser@gmail.com" --env="IMAP_PASSWORD=DuoS123456" --env="IMAP_HOST=imap.gmail.com" --env="IMAP_PORT=993" --env="IMAP_SECURITY=true" --env="IMAP_MAILBOX=INBOX" --env="IMAP_SEEN=true" --env="IMAP_COMPANY=103" --env="IMAP_TENAT=1" --env="IMAP_FETCH=true" --env="SYS_SMTP_HOST=$SMTP_HOST" --env="SYS_SMTP_PORT=$SMTP_PORT" --env="SYS_SMTP_USER=$SMTP_USER" --env="SYS_SMTP_PASSWORD=$SMTP_PASSWORD" --env="SYS_RESOURCESERVICE_HOST=resourceservic.$FRONTEND" --env="SYS_RESOURCESERVICE_VERSION=$HOST_VERSION" --env="SYS_FILESERVICE_HOST=fileservice.$FRONTEND" --env="SYS_FILESERVICE_VERSION=$HOST_VERSION" --env="SYS_SCHEDULEWORKER_HOST=scheduleworker.$FRONTEND" --env="SYS_SCHEDULEWORKER_VERSION=$HOST_VERSION" --env="SYS_LITETICKET_HOST=liteticket.$FRONTEND" --env="SYS_LITETICKET_VERSION=$HOST_VERSION" --env="SYS_INTERACTIONS_HOST=interactions.$FRONTEND" --env="SYS_INTERACTIONS_VERSION=$HOST_VERSION" --env="SYS_ARDSLITESERVICE_HOST=ardsliteservice.$FRONTEND" --env="SYS_ARDSLITESERVICE_VERSION=$HOST_VERSION" --expose=8877/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name mailreceiver mailreceiver node /usr/local/src/mailreceiver/app.js;
echo "MailReceiver Installation Completed"
sleep 3
}
install_socialconnector(){
clear
echo "Starting SocicalConnector Service Installation"
	cd /usr/src/;
	if [ ! -d "DVP-SocialConnector" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone git://github.com/DuoSoftware/DVP-SocialConnector.git;
	fi
	cd DVP-SocialConnector;
	docker build -t "socialconnector:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/socialconnector/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_SOCIALCONNECTOR_PORT=8878" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="SYS_RABBITMQ_HOST=$RABBITMQ_HOST" --env="SYS_RABBITMQ_PORT=$RABBITMQ_PORT" --env="SYS_RABBITMQ_USER=$RABBITMQ_USER" --env="SYS_RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD" --env="SYS_SMSSERVER_HOST=$SMS_SERVER" --env="SYS_SMSSERVER_PORT=$SMS_PORT" --env="SYS_SMSSERVER_PASSWORD=$SMS_PASSWORD" --env="SYS_SMSSERVER_USER=$SMS_USER" --env="SYS_SMPP_HOST=$SMTP_HOST" --env="SYS_SMPP_PORT=$SMTP_PORT" --env="SYS_SMPP_PASSWORD=$SMTP_PASSWORD" --env="SYS_SMPP_USER=$SMTP_USER" --env="SMS_QUEUE_NAME=$SMS_QUEUE" --env="SMS_MODE=$SMS_MODE" --env="TWITTER_QUEUE_NAME=$TWITTER_QUEUE" --env="FACEBOOK_QUEUE_NAME=$FACEBOOK_QUEUE" --env="" --env="VIRTUAL_HOST=socialconnector.*" --env="LB_FRONTEND=socialconnector.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_RESOURCESERVICE_HOST=resourceservice.$FRONTEND" --env="SYS_RESOURCESERVICE_VERSION=$HOST_VERSION" --env="SYS_INTERACTIONS_HOST=interactions.$FRONTEND" --env="SYS_INTERACTIONS_VERSION=$HOST_VERSION" --env="SYS_SCHEDULEWORKER_HOST=scheduleworker.$FRONTEND" --env="SYS_SCHEDULEWORKER_VERSION=$HOST_VERSION" --env="SYS_LITETICKET_HOST=liteticket.$FRONTEND" --env="SYS_LITETICKET_VERSION=$HOST_VERSION" --env="SYS_ARDSLITESERVICE_HOST=ardsliteservice.$FRONTEND" --env="SYS_ARDSLITESERVICE_VERSION=$HOST_VERSION" --env="SYS_FACEBOOK_URL=https://graph.facebook.com/" --expose=8878/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name socialconnector socialconnector node /usr/local/src/socialconnector/app.js;
echo "SocialConnector Service Installation Completed"
sleep 3
}
install_todolistservice(){
clear
echo "Starting ToDOListService Installation.."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-ToDoListService" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone git://github.com/DuoSoftware/DVP-ToDoListService.git;
	fi
	cd DVP-ToDoListService;
	docker build -t "todolistservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/todolistservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_TODOLISTSERVICE_PORT=8879" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_NAME=todolistservice.$FRONTEND" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="VIRTUAL_HOST=todolistservice.*" --env="LB_FRONTEND=todolistservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_SCHEDULEWORKER_HOST=scheduleworker.$FRONTEND" --env="SYS_SCHEDULEWORKER_VERSION=$HOST_VERSION" --env="SYS_NOTIFICATIONSERVICE_HOST=notificationservice.$FRONTEND" --env="SYS_NOTIFICATIONSERVICE_VERSION=$HOST_VERSION" --expose=8879/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name todolistservice todolistservice node /usr/local/src/todolistservice/app.js;
echo "ToDoListService Installation Completed"
sleep 3
}
install_walletservice(){
clear
echo "Starting WalletService Installation..."
show_spinner
	cd /usr/src;
	if [ ! -d "DVP-Wallet" ]; then
  	 git clone  git://github.com/DuoSoftware/DVP-Wallet.git;
	fi
	rm -rf DVP-Wallet;
	git clone  git://github.com/DuoSoftware/DVP-Wallet.git;
	cd DVP-Wallet;
	npm install
	npm install -g forever
	clear
	echo "Opening Config file..."
	sleep 3
	FILE="/usr/src/DVP-Wallet/config/default.js"
	vim $FILE
	echo "Config file edited sucessfully..."
	sleep 3
	forever start app.js
	echo "WalletService Installtion Completed"
sleep 3
}
install_billingservice(){
clear
echo "Starting BillingService Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-Billing" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone  git://github.com/DuoSoftware/DVP-Billing.git;
	fi
	cd DVP-Billing;
	docker build -t "billingservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/billingservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_BILLINGSERVICE_PORT=8881" --env="BILLING_SCHEDULE_FREQUENCY=$BILLING_SCHEDULE_FREQUENCY" --env="BILLING_SCHEDULE_TRIES=$BILLING_SCHEDULE_TRIES" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_DATABASE_HOST=$DATABASE_HOST" --env="SYS_DATABASE_TYPE=$DATABASE_TYPE" --env="SYS_DATABASE_POSTGRES_USER=$DATABASE_POSTGRES_USER" --env="SYS_DATABASE_POSTGRES_PASSWORD=$DATABASE_POSTGRES_PASSWORD" --env="SYS_SQL_PORT=$SQL_PORT" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_RABBITMQ_HOST=$RABBITMQ_HOST" --env="SYS_RABBITMQ_PORT=$RABBITMQ_PORT" --env="SYS_RABBITMQ_USER=$RABBITMQ_USER" --env="SYS_RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD" --env="VIRTUAL_HOST=billingservice.*" --env="LB_FRONTEND=billingservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_USERSERVICE_HOST=userservice.$FRONTEND" --env="SYS_USERSERVICE_VERSION=$HOST_VERSION" --env="SYS_WALLETSERVICE_HOST=$WALLETSERVICE_HOST:$WALLERTSERVICE_PORT" --env="SYS_WALLETSERVICE_VERSION=$HOST_VERSION" --expose=8881/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name billingservice billingservice node /usr/local/src/billingservice/app.js;
echo "BillingService Installation Completed"
sleep 3
}
install_integrationapi(){
clear
echo "Starting IntegrationAPI Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-IntegrationAPI" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone  git://github.com/DuoSoftware/DVP-IntegrationAPI.git;
	fi
	cd DVP-IntegrationAPI;
	docker build -t "integrationapi:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/integrationapi/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_INTEGRATIONAPI_PORT=8882" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="VIRTUAL_HOST=integrationapi.*" --env="LB_FRONTEND=integrationapi.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8882/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name integrationapi integrationapi node /usr/local/src/integrationapi/app.js;
echo "IntegrationAPI Installation Completed"
sleep 3
}
install_dashboardservice(){
clear
echo "Starting DashboardService Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-DashBoardService" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone  git://github.com/DuoSoftware/DVP-DashBoardService.git;
	fi
	cd DVP-DashBoardService;
	docker build -t "dashboardservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/dashboardservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_DASHBOARDSERVICE_PORT=8883" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_REDIS_DB_DASHBOARD=$REDIS_DB_DASHBOARD" --env="SYS_REDIS_DB_ARDS=$REDIS_DB_ARDS" --env="SYS_DASHBOARD_REDIS_HOST=$DASHBOARD_REDIS_HOST" --env="SYS_DASHBOARD_REDIS_PORT=$DASHBOARD_REDIS_PORT" --env="SYS_DASHBOARD_REDIS_PASSWORD=$DASHBOARD_REDIS_PASSWORD" --env="VIRTUAL_HOST=dashboardservice.*" --env="LB_FRONTEND=dashboardservice.$FRONTEND" --env="LB_PORT=$LB_PORT" --env="SYS_STATSD_HOST=$STATSD_HOST" --env="SSYS_STATSD_PORT=$STATSD_PORT" --expose=8883/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name dashboardservice dashboardservice node /usr/local/src/dashboardservice/app.js;
echo "DashboardService Installation Completed"
sleep 3
}
install_qamodule(){
clear
echo "Starting QAModule Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-QAModule" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone  git://github.com/DuoSoftware/DVP-QAModule.git;
	fi
	cd DVP-QAModule;
	docker build -t "qamodule:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/qamodule/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_QAMODULE_PORT=8884" --env="HOST_VERSION=$HOST_VERSION" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT" --env="VIRTUAL_HOST=qamodule.*" --env="LB_FRONTEND=qamodule.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8884/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name qamodule qamodule node /usr/local/src/qamodule/app.js;
echo "QAModule Installation Completed"
sleep 3
}
install_csatservice(){
clear
echo "Starting CSATService Installation..."
show_spinner
	cd /usr/src/;
	if [ ! -d "DVP-CSATService" ]; then
	  # Control will enter here if $DIRECTORY exists.
	  git clone  git://github.com/DuoSoftware/DVP-CSATService.git;
	fi
	cd DVP-CSATService;
	docker build -t "csatservice:latest" .;
	cd /usr/src/;
	docker run -d -t --memory="512m" -v /etc/localtime:/etc/localtime:ro --env="NODE_CONFIG_DIR=/usr/local/src/csatservice/config" --env="HOST_TOKEN=$HOST_TOKEN" --env="HOST_CSATSERVICE_PORT=8883" --env="HOST_VERSION=$HOST_VERSION" --env="HOST_NAME=csatservice" --env="SYS_REDIS_HOST=$REDIS_HOST" --env="SYS_REDIS_PASSWORD=$REDIS_PASSWORD" --env="SYS_REDIS_PORT=$REDIS_PORT" --env="SYS_MONGO_HOST=$MONGO_HOST" --env="SYS_MONGO_USER=$MONGO_USER" --env="SYS_MONGO_PASSWORD=$MONGO_PASSWORD"  --env="SYS_MONGO_DB=$MONGO_DB" --env="SYS_MONGO_PORT=$MONGO_PORT"  --env="LB_FRONTEND=qamodule.$FRONTEND" --env="LB_PORT=$LB_PORT" --expose=8884/tcp --log-opt max-size=10m --log-opt max-file=10 --restart=always --name csatservice csatservice node /usr/local/src/csatservice/app.js;
echo "CSATService Installation Completed"
sleep 3
}

docker_dynamicconfigurationgenerator(){
	
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f dynamicconfigurationgenerator;
		install_dynamicconfigurationgenerator;
	else 
		docker rm -f dynamicconfigurationgenerator;
		docker rmi dynamicconfigurationgenerator;
		install_dynamicconfigurationgenerator;
	fi
}
docker_fileservice(){

	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f fileservice;
		install_fileservice;
	else
		docker rm -f fileservice;
		docker rmi fileservice;
		install_fileservice;
	fi
}
docker_resourceservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f resourceservice;
		install_resourceservice;
	else
		docker rm -f resourceservice;
		docker rmi resourceservice;
		install_resourceservice;
	fi
}
docker_ardsmonitoring(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f ardsmonitoring;
		install_ardsmonitoring;
	else
		docker rm -f ardsmonitoring;
		docker rmi ardsmonitoring;
		install_ardsmonitoring;
	fi
}
docker_phonenumbertrunkservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f phonenumbertrunkservice;
		install_phonenumbertrunkservice;
	else
		docker rm -f phonenumbertrunkservice;
		docker rmi phonenumbertrunkservice;
		install_phonenumbertrunkservice;
	fi	
}
docker_limithandler(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f limithandler;
		install_limithandler;
	else
		docker rm -f limithandler;
		docker rmi limithandler;
		install_limithandler:
	fi

}
docker_ardsliteroutingengine(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f ardsliteroutingengine;
		install_ardsliteroutingengine;
	else
		docker rm -f ardsliteroutingengine;
		docker rmi ardsliteroutingengine;
		install_ardsliteroutingengine;
	fi
}
docker_notificationservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f notificationservice;
		install_notificationservice;
	else
		docker rm -f notificationservice;
		docker rmi notificationservice;
		install_notificationservice;
	fi
}
docker_engagementservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f engagementservice;
		install_engagementservice;
	else
		docker rm -f engagementservice;
		docker rmi engagementservice;
		install_engagementservice;
	fi
}
docker_pbxservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f pbxservice;
		install_pbxservice;
	else
		docker rm -f pbxservice;
		docker rmi pbxservice;
		install_pbxservice;
	fi
}
docker_callbackservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f callbackservice;
		install_callbackservice;
	else
		docker rm -f callbackservice;
		docker rmi callbackservice;
		install_callbackservice;
	fi
}
docker_voxboneapi(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f voxboneapi;
		install_voxboneapi;
	else
		docker rm -f voxboneapi;
		docker rmi voxboneapi;
		install_voxboneapi;
	fi
}
docker_ruleservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f ruleservice;
		install_ruleservice;
	else
		docker rm -f ruleservice;
		docker rmi ruleservice;
	fi
}
docker_conference(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f ruleservice;
		install_ruleservice;
	else
		docker rm -f ruleservice;
		docker rmi ruleservice;
		install_ruleservice;
	fi
}
docker_interactions(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f interactions
		install_interactions
	else
		docker rm -f interactions
		docker rmi interactions
		install_interactions
	fi
}
docker_templates(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f templates
		install_templates;
	else
		docker rm -f templates;
		docker rmi templates;
		install_templates;
	fi
}
docker_ardsliteservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f ardsliteservice;
		install_ardsliteservice;
	else
		docker rm -f ardsliteservice;
		docker rmi ardsliteservice;
		install_ardsliteservice;
	fi
}
docker_userservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f userservice;
		install_userservice;
	else
		docker rm -f userservice;
		docker rmi userservice;
	fi
}
docker_monitorrestapi(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f monitorrestapi;
		install_monitorrestapi;
	else
		docker rm -f monitorrestapi;
		docker rmi monitorrestapi
		install_monitorrestapi;
	fi
}
docker_httpprogrammingapi(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f httpprogrammingapi;
		install_httpprogrammingapi;
	else
		docker rm -f httpprogramming;
		docker rmi httpprogramming;
		install_httpprogramming;
	fi
}
docker_sipuserendpointservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f sipuserendpointservice;
		install_sipuserendpointservice;
	else
		docker rm -f sipuserendpointservice;
		docker rmi sipuserendpointservice;
		install_sipuserendpointservice;
	fi
}
docker_clusterconfiguration(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f clusterconfiguration;
		install_clusterconfiguration;
	else
		docker rm -f clusterconfiguration;
		docker rmi clusterconfiguration;
		install_clusterconfiguration;
	fi
}
docker_eventmonitor(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f eventmonitor;
		install_eventmonitor;
	else
		docker rm -f eventmonitor;
		docker rmi eventmonitor;
		install_eventmonitor;
	fi
}
docker_queuemusic(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f queuemusic;
		install_queuemusic;
	else
		docker rm -f queuemusic;
		docker rmi queuemusic;
		install_queuemusic;
	fi
}
docker_appregistry(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f appregistry
		install_appregistry
	else
		docker rm -f appregistry
		docker rmi appregistry
		install_appregistry
	fi
}
docker_autoattendant(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f autoattendant;
		install_autoattendant;
	else
		docker rm -f autoattendant;
		docker rmi autoattendant;
		install_autoattendant;
	fi
}
docker_dashboard(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f cdrprocessor;
		install_cdrprocessor;
	else
		docker rm -f cdrprocessor;
		docker rmi cdrprocessor;
	fi
}
docker_eventservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f eventservice;
		install_eventservice;
	else
		docker rm -f eventservice;
		docker rmi eventservice;
	fi
}
docker_liteticket(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f liteservice;
		install_liteservice;
	else
		docker rm -f liteservice;
		docker rmi liteservice;
	fi
}
docker_scheduleworker(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f scheduleworker
		install_scheduleworker
	else
		docker rm -f scheduleworker
		docker rmi schduleworker
		install_schduleworker
	fi
}
docker_cdrgenerator(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f cdrgenerator;
		install_cdrgenerator
	else
		docker rm -f cdrgenerator;
		docker rmi cdrgenerator;
	fi
}
docker_productivityservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f productivityservice;
		install_productivityservice;
	else
		docker rm -f productivityservice;
		docker rmi productivityservice;
		install_productivityservice;
	fi
}
docker_mailreceiver(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f mailreceiver;
		install_mailreceiver;
	else
		docker rm -f mailreceiver;
		docker rmi mailreceiver;
		install_mailreceiver;
	fi
}
docker_socialconnector(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f socialconnector;
		install_socialconnector;
	else
		docker rm -f socialconnector;
		docker rmi socialconnector;
		install_socialconnector;
	fi
}
docker_todolisteservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f todolistservice;
		install_todolistservice;
	else
		docker rm -f todolistservice;
		docker rmi todolistservice;
		install_todolistservice;
	fi
}
docker_billingservice(){
	 if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f billingservice;
		install_billingservice;
	else
		docker rm -f billingservice;
		docker rmi billingservice;
	fi
}
docker_intergrationapi(){
	 if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f intergrationapi;
		install_intergration;
	else
		docker rm -f intergrationapi;
		docker rmi intergrationapi;
	fi
}
docker_dashboardservice(){
	 if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f dashboardservice;
		install_dashboardservice;
	else
		docker rm -f dashboardservice;
		docker rmi dashboardservice;
		install_dashboardservice;
	fi
}
docker_qamodule(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f qamodule;
		install_qamodule;
	else
		docker rm -f qamodule;
		docker rmi qamodule;
		install_qamodule;
	fi
}
docker_csatservice(){
	if [ "$SET_CONFIG" = 1 ]; then
		docker rm -f csatservice;
		install_csatservice;
	else
		docker rm -f csatservice;
		docker rmi csatservice;
		install_csatservice;
	fi
}

# function to display menus
show_menus() {
	clear
	toilet -f bigmono9 -F gay facetone
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo "        M A I N - M E N U        "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Deploy a Release"
	echo "2. Fresh Installation"
	echo "3. Change Docker Configuration"
	echo "0. Exit"
}

show_submenus(){
	clear
	echo "~~~~~~~~~~~~~~~~~~~~"
	echo " S U B - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~"
	echo "1. FileService			21. AutoAttendant"
	echo "2. UserService			22. DialerAPI"
	echo "3. APPRegistry			23. EventMonitor"
        echo "4. Interactions			24. LiteTicket"
	echo "5. WalletService		25. HTTPProgrammingMonitorAPI"
        echo "6. CDRGenerator			26. RuleService"
	echo "7. Conference			27. MonitorRestAPI"
        echo "8. PBXService			28. SocialConnector"
        echo "9. CDRProcessor			29. Dashboard"
        echo "10. ARDSMonitoring		30. SIPUserEndpointService"
        echo "11. Templates			31. DynamicConfigurationGenerator"
        echo "12. ClusterConfiguration	32. LimitHandler"
	echo "13. HTTPProgrammingAPI		33. NotificationService"
        echo "14. QueueMusic			34. ProductivityService"
        echo "15. VoxBoneAPI			35. ARDSLiteRoutingEngine"
        echo "16. EventService		36. ARDSLiteService"
        echo "17. IntegrationAPI		37. PhoneNumberTrunkService"
        echo "18. ResourceService		38. ToDOListService"
        echo "19. DashboardService		39. CallBackService"
	echo "20. ScheduleWorker		40. QAModule"
	echo "41. CSATService"

	echo "99. Back"
	echo "0. Exit"
}
show_deploymentmenus(){
        clear
        echo "~~~~~~~~~~~~~~~~~~~~"
        echo " Deployment - M E N U"
        echo "~~~~~~~~~~~~~~~~~~~~"
        echo "1. One App Server Deployment"
        echo "2. Two App Server Deployment"
	echo "3. Three App Server Deployment"
	echo "9. Back"
        echo "0. Exit"
}
show_deployserverno(){
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo " Deployment Server - M E N U"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo "1. Deployment Server No"
	echo "9. Back"
        echo "0. Exit"

}

read_options(){
	local choice
	read -p "Enter choice [ 1 - 4] " choice
	case $choice in
		1) main_one ;;
		2) main_two ;;
		3) main_three ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
read_sub_options(){
	local choice
        read -p "Enter choice [ 1 - 40] " choice
        case $choice in
                1) install_fileservice ;;
                2) install_userservice ;;
		3) install_appregistry ;;
		4) install_interactions ;;
		5) install_walletservice ;;
		6) install_cdrgenerator ;;
		7) install_conference ;;
		8) install_pbxservice ;;
		9) install_cdrprocessor ;;
		10) install_ardsmonitoring ;;
		11) install_templates ;;
		12) install_clusterconfig ;;
		13) install_httpprogrammingapi;;
		14) install_queuemusic ;;
		15) install_voxboneapi ;;
		16) install_eventservice ;;
		17) install_integrationapi ;;
		18) install_resourceservice ;;
		19) install_dashboardservice ;;
		20) install_scheduleworker ;;
		21) install_autoattendant ;;
		22) install_dialerapi ;;
		23) install_eventmonitor ;;
		24) install_liteticket ;;
		25) install_httpprogrammingmonitorapi ;;
		26) install_ruleservice ;;
		27) install_monitorrestapi ;;
		28) install_socialconnector ;;
		29) install_dashboard ;;
		30) install_sipuserendpointservice ;;
		31) docker_dynamicconfigurationgenerator ;;
		32) install_limithandler ;;
		33) install_notificationservice ;;
		34) install_productivityservce ;;
		35) install_ardsliteroutingengine ;;
		36) install_ardsliteservice ;;
		37) install_phonenumbertrunkservice ;;
		38) install_todolistservice ;;
		39) install_callbackservice ;;
		40) install_qamodule ;;
		41) install_csatservice ;;
		99) show_menus ;; 
               0) exit 0;;
#		99) show_menus ;;
                *) echo -e "${RED}Error...${STD}" && sleep 2
        esac

}
read_deployment_options(){
	local choice
	read -p "Enter choice [1-3] " choice
	case $choice in
		1) server_one ;;
		2) deploy_choice_two ;;
		3) deploy_choice_three;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
#read_deploymentserver_options(){
#	local choice
#	read -p "Enter Choice " choice
#	case $choice in
#		1) deploy_servers ;;
#		2) deploy_serves ;;
#		3) deploy_servers ;;
#		0) exit 0;;
#		*) echo -e "${RED}Error....${STD}" && sleep2
#	esac
#}

# ----------------------------------------------
# Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
#trap '' SIGINT SIGQUIT SIGTSTP


# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 	show_menus
	read_options
done
