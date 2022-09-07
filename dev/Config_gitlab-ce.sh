#!/bin/bash
#
# Author : guilhem Schlosser
# Date : Aout 2022
# Name of the file: Config_gitlab-ce.sh
# Version 1.0.0 :
# Title: Self-hosted gitlab-ee
# Permit to: Change the password for the root account of gitlab (default account)
#			 Add the URL of your Gitlab Self-hosted
#
# Tested on: Centos7 but maybe can work in Fedora, or debian
#
# Required:  mini	 |     recommanded
#			2 core	---		4 core 
#           2048 mo ram  -- 4096 mo
#
#			Static IP and dns configured if necessary to be accessible from the Internet
#			external rules firewall if you have (pfsense (...) ) to be accessible from the Internet
#
# To run the script manualy : sudo bash ./Config_gitlab-ce.sh
####################################################################

# PID Shell script
echo "PID of this script: $$"
#Name of script
echo "The name of the script is : $0"
echo

echo "This script allows to install the gitlab-ce solution.."
echo
echo "Set the password to root, which is the default administrator user of gitlab-ce."
echo
echo "But also to define the url of your gitlab-ce:"
echo "http://example.com or https://example.com"
echo
echo "It should not be executed again."
echo
sleep 1
echo "Installation in progress, this step may take few time (Depends on the machine)"
echo

# This command permit to fill the the URL of your gitlab-ce
EXTERNAL_URL="${InputURL}" yum install gitlab-ce.x86_64 -y


# root password is the default account for gitlab, this command add the passowrd
cd /etc/gitlab
gitlab-rake 'gitlab:password:reset[root]'

# Reconfigure the package with the provided information
gitlabctl-reconfigure

exit 0