#!/usr/bin/env bash
# @license GNU General Public License - Version 3, 29 June 2007
# @author Luís Ferreira

FILE='Vagrantfile';

dialog 	--backtitle "InstallGrant" \
	--scrollbar \
	--title '01. Welcome' --msgbox "	Hi, Welcome to InstallGrant, a Multi-Stack Virtual Machine Generator for a lot of CMS's to use with vagrant: \n \
					- MediaWiki;\n \
					- Tiny Tiny RSS;\n \
					- Part Keepr.\n\n	Follow this steps to create your own virtual machine with your favourite CMS!" 13 50;		
				
if [ -f $FILE ];
then
	dialog 	--colors \
		--backtitle "InstallGrant" \
		--title '\Z1\ZrError' \
		--stderr \
		--yes-label 'Ok' --no-label 'Cancel' \
		--yesno "\Z1\ZrError: Vagrant file exists, please delete 'Vagrantfile' and try again!" 7 50;
else   
	echo "...";
fi
