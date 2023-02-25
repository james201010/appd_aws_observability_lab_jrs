#!/bin/bash

#
# Script to deploy AppDynamics Agents to two different Kubernetes clusters using a Helm chart.
# This script uses the AD-Workshop-Utils.jar to perform the deployment with elevated permissions.
#
# The Helm chart is configured to deploy the following agent types:
#
# - Cluster Agent
# - Java Agent
# - ServerMonitoring Agent
# - NetViz Agent


appd_controller_details_file_path="${appd_controller_details_file_path:-}"
appd_controller_details_file_valid="${appd_controller_details_file_valid:-false}"


if [ -f "./scripts/state/controller-config-file-valid.txt" ]; then
   appd_controller_details_file_valid=$(cat ./scripts/state/controller-config-file-valid.txt)
   appd_controller_details_file_path=$(cat ./scripts/state/controller-config-file-path.txt)
fi


appd_wrkshp_last_setupstep_done="100"

if [ "$appd_controller_details_file_valid" == "true" ]; then

  java -DworkshopUtilsConf=./applications/post-modernization/clusteragent/agent-setup.yaml -DworkshopAction=elevatedinstall -DcontrollerConf=${appd_controller_details_file_path} -DlastSetupStepDone=${appd_wrkshp_last_setupstep_done} -DshowWorkshopBanner=false -jar ./AD-Workshop-Utils.jar
else 
  java -DworkshopUtilsConf=./applications/post-modernization/clusteragent/agent-setup.yaml -DworkshopAction=elevatedinstall -DlastSetupStepDone=${appd_wrkshp_last_setupstep_done} -DshowWorkshopBanner=false -jar ./AD-Workshop-Utils.jar

fi

#rm -f ./applications/post-modernization/clusteragent/values-ca1.yaml
