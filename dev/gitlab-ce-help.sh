#!/bin/bash
#
# Author : guilhem Schlosser
# Date : Aout 2022
# Name of the file: gitlab-ce-help.sh
# Version 1.0.0 :
# Title: gitlab-ce-help
# Permit to: Allows for quick access to essential commands
#
# Tested on: Centos7 but maybe can work in Fedora, or debian
#
# To run the script manualy : sudo bash ./Gitlab-helper.sh
################################################################################
#                                                                              #
#  Copyright (C) 2022, 2022 Guilhem SCHLOSSER                                  #
#                                                                              #      
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 2 of the License, or           #
#  (at your option) any later version.                                         #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################

#########################
# The command line help #
#########################
display_help() {
    echo "Usage: $0 [option...]" >&2
    echo
    echo "   -h, --help    show some useful commands for gitlab-ce"
    echo
    systemctl start gitlab
    systemctl restart gitlab
    systemctl stop gitlab
    
    exit 1
}

display_help