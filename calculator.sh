#!/bin/bash

# Function to display the menu
display_menu() {
    echo "Select operation:"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Modulus"
    echo "6. Exponentiation"
    echo "7. Exit"
}


# Function to perform addition
addition() {
    echo -n "Enter first number: "
    read a
    echo -n "Enter second number: "
    read b
    result=$(echo "$a + $b" | bc)
    echo "Result: $result"
}

# Function to perform subtraction
subtraction() {
    echo -n "Enter first number: "
    read a
    echo -n "Enter second number: "
    read b
    result=$(echo "$a - $b" | bc)
    echo "Result: $result"
}

# Function to perform multiplication
multiplication() {
    echo -n "Enter first number: "
    read a
    echo -n "Enter second number: "
    read b
    result=$(echo "$a * $b" | bc)
    echo "Result: $result"
}

# Function to perform division
division() {
    echo -n "Enter first number: "
    read a
    echo -n "Enter second number: "
    read b
    if [ "$b" -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
    else
        result=$(echo "scale=2; $a / $b" | bc)
        echo "Result: $result"
    fi
}

# Function to perform modulus
modulus() {
    echo -n "Enter first number: "
    read a
    echo -n "Enter second number: "
    read b
    result=$(echo "$a % $b" | bc)
    echo "Result: $result"
}

# Function to perform exponentiation
exponentiation() {
    echo -n "Enter base number: "
    read a
    echo -n "Enter exponent: "
    read b
    result=$(echo "$a ^ $b" | bc)
    echo "Result: $result"
}

while true; do
    display_menu
    echo -n "Enter choice [1-7]: "
    read choice

    case $choice in
        1)
            addition
            ;;
        2)
            subtraction
            ;;
        3)
            multiplication
            ;;
        4)
            division
            ;;
        5)
            modulus
            ;;
        6)
            exponentiation
            ;;
        7)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    echo ""
done
