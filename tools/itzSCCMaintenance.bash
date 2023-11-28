#/usr/bin/bash
#

#---------------------------------------------------------------------------------------------
# prompt utility
# usage:
#    yesno "prompt with all spaces and punctiation (y|n)? "
#    returns 0 for Yes|Y|y
#    returns 1 for No|N|n
#---------------------------------------------------------------------------------------------

yesno() {
echo in yesno - "$@"
	read -p "$@" -n 1 -r
	echo

	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		return 0
	elif [[ $REPLY =~ ^[Nn]$ ]]
	then
		return 1
	else
		echo "Invalid response, please try again."
		# echo "\$@ = $@"
		# making recursive call and returning valid answer back... eventually
		yesno "$@"
		return $?
	fi
}

#---------------------------------------------------------------------------------------------

echo "Setting resource group"
ibmcloud target -g SCC-L3 > /dev/null

skip=0


ibmcloud is instances --resource-group-name SCC-L3 -q | while read x
do 
  # skip the header from the output
  if [ $skip == 0 ]
  then 
    skip=1
    continue
  fi

# vsi=`echo $x | cut -f1 -d" "`
# echo line = "$x"
# echo $x | { read inst_id inst_name junk }

read inst_id inst_name junk <<< ${x}

echo inst_id = $inst_id
echo inst_name = $inst_name

read junk createdOn <<< `ibmcloud is instance $inst_id | grep -i created`

yesno "Instance: $inst_name was created on $createdOn. Do you want to delete (y|n)?" 
if [[ $? == 0 ]]
then
  echo "Delete $inst_name $inst_id"
else
  echo "Keep $inst_name $inst_id"
fi

done
