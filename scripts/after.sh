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
	    mv nssicc.war "ssicc${country///}.war"

	    #shell path
	    cd "${DEPLOY_DIRECTORY}"

	    #execute shell
	    sh ".Auto_nSSICC_${ENVIRONMENT}_AutomaticoQA.sh" 'NSSICC' "${country}"

	    #WAR directory
	    cd "${NSSICC_DIRECTORY}"
	    #remove war renamed
	    mv "ssicc${country///}.war" nssicc.war
	fi

	if [ -d "$SSICC_DIRECTORY" ]; then
		#shell path
		cd "${DEPLOY_DIRECTORY}"

		#execute shell
		touch "Auto_SSICC_${ENVIRONMENT}_Automatico_${country///}.txt"
		#sh ".Auto_SSICC_${ENVIRONMENT}_Automatico.sh" 'SSICC' '${country}'
	fi

done
