# !/bin/bash script
#
# variables in shell

echo "WELCOME TO CALCULATOR, enter operation +,-,/,or *"
read operation
echo enter first num
read num1
echo enter second num
read num2

if [ "$operation" = "+" ] 
then
echo $num1 + $num2 = $(($num1+$num2))
elif [ "$operation" = "-" ] 
then
echo $num1 - $num2 = $(($num1-$num2))
elif [ "$operation" = "*" ] 
then
echo $num1 * $num2 = $(($num1*$num2))
elif [ "$operation" = "/" ] 
then
echo $num1 '/' $num2 = $(($num1/$num2))
else 
echo You did something wrong.
fi
