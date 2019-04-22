#!/bin/bash

COUNTRIES=("pe/qas")
ENVIRONMENT="PDP"
NSSICC_DIRECTORY="/home/oracle/desplieguesnSSiCC/EARs/NSSICC"
SSICC_DIRECTORY="/home/oracle/desplieguesnSSiCC/EARs/SSICC"
DEPLOY_DIRECTORY="/home/oracle/desplieguesnSSiCC"

for country in "${COUNTRIES[@]}"; do

	if [ -d "$NSSICC_DIRECTORY" ]; then
		#WAR directory
	  	cd "${NSSICC_DIRECTORY}"

	    #rename war
	    #mv nssicc.war "ssicc${country///}.war"

	    #shell path
	    cd "${DEPLOY_DIRECTORY}"

	    #execute shell
	    sh "caleidos.sh" 'NSSICC' "${country}"

	    #WAR directory
	    cd "${NSSICC_DIRECTORY}"
	    #remove war renamed
	    #mv "ssicc${country///}.war" nssicc.war
	fi

done
