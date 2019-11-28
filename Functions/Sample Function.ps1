# Script parameters for the script
param([int]$number1, [int]$number2)

Write-Host("Num-1: " + $number1 + ", Num-2: " + $number2)

function Add-Numbers([int]$num1=0, [int]$num2=0)
{
    return $num1 + $num2
}

# Call function
$sum = Add-Numbers -num1 $number1 -num2 $number2

Write-Host($sum)