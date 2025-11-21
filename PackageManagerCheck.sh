#!/bin/bash
#
########################## Red Hat Tests ####################
if (which rpm &> /dev/null)
then
	item_rpm=1
	echo "You have default rpm."
#
else
	item_rpm=0
#
fi
#
if (which flatpak &> /dev/null)
then
	item_flatpak=1
	echo "Masz kontener aplikacji flatpak."
#
else
	item_flatpak=0
#
fi
#
if (which dnf &> /dev/null)
then
	item_dnfyum=1
	echo "You have dnf package manager."
#
elif (which yum &> /dev/null)
then
	item_dnfyum=1
	echo "yum package manager is available."
else
	item_dnfyum=0
#
fi
###
redhatscore=$[$item_rpm + $item_dnfyum + $item_flatpak]
#
#########################Debian tests###############################
#
echo
echo "seeking for Debian packages"
####
if (which dpkg &> /dev/null)
then
	item_dpkg=1
	echo "dpkg - OK"
#
else
	item_dpkg=0
#
fi
####
if (which apt &> /dev/null)
then
	item_aptaptget=1
	echo "apt - OK"
#
elif (which apt-get &> /dev/null)
then
	item_aptaptget=1
	echo "apt-get / apt-cache  OK>"
#
else
	item_aptaptget=0
fi
###
if (which snap &> /dev/null)
then item_snap=1
	echo "snap app container OK"
#
else
	item_snap=0
#
fi
####
#
debianscore=$[$item_dpkg + $item_aptaptget + $item_snap]
#
#
####################### distribution type confirmation #####################
#
echo
if [ $debianscore -gt $redhatscore ]
then
	echo "Debian rules"
#
elif [ $redhatscore -gt $debianscore ]
then
	echo "Red Hat King"
else
	echo "unable to confirm Linux distribution"
fi
#
echo
#
################################
#
exit
$
