#!/bin/bash

# Program to calculate overtime hours & pay of employees
# Author : Kekin Chheda

for (( i=1; i <= 10; i++ ))
do
	read -p "Enter total working hours for employee-${i}: " employee[$i]
done

for (( i=1; i <= ${#employee[@]}; i++ ))
do
	echo "Total working hours: ${employee[$i]}"
	overtimeHours=$((${employee[$i]}-40))
	echo "Overtime hours of employee: ${overtimeHours}"
	echo "Overtime pay: $(expr $overtimeHours \* 1200)"
done




