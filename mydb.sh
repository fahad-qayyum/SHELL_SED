#!/bin/sh


a=$1
b=$2
c=$3
d=$4

if [[ $# -ne 4 ]]; then
	echo "Wrong Arguments"
else
	if [[ $c = "-check" ]]; then
		while read -r -u2 A B; read -r -u6 C D E; 
		do
			if [[ $B -lt $d ]]; then
				echo $A $B $E
			fi
		done 2<$a 6<$b
	fi

	if [[ $c = "-show" ]]; then
		while read -r -u3 A B; read -r -u4 C D E; do
			if [[ $d = $A ]]; then
				var=$(echo "scale=4;$B*$D" |bc)
				echo $var
			fi
		done 3<$a 4<$b
		
	fi 
fi
