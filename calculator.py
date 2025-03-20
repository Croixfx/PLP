#Getting input from user

num1 = float(input("Enetr first number: "))
num2 = float(input("Enter second number: "))
operator = input("Enter operator (+, -, *, /):")


#Perfom calculation based on operation
if operator == '+':
    answer = num1 + num2
    print(f"{num1} + {num2} = {answer}")
elif operator == '-':
    answer = num1 - num2
    print(f"{num1} - {num2} = {answer}")
elif operator == '*':
    answer = num1 * num2
    print(f"{num1} * {num2} = {answer}")
elif operator == '/':
    if num2 != 0:
        answer = round(num1 / num2, 2)
        print(f"{num1} /{num2} = {answer}")
    else:
        print("Error: Division by zero is not allowed.")
else:
    print("Invalid operator chosen! Please enter +, -, *, or / .")