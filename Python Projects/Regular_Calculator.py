def display():
    print("Welcome to Chris's Calculator")
    print("please enter your values and how you would like it to be calculated\n")

def info():
    while True: 
        number_1 = float(input("Enter first number: "))
        number_2 = float(input("Enter second number: "))
    
        more_numbers = input("Would you like to add more variables (Y/N?: ")
        if more_numbers == 'N':
            continue
        else: 
            number_3 = float(input("Enter other number: "))
    
    math_symbol = input("Pick One: +, -, /, *: ")
    return number_1, number_2, math_symbol

def calculator(number_1, number_2, math_symbol):
    while True:
        if math_symbol == '+':
            answer = number_1 + number_2 
        elif math_symbol == '-':
            answer = number_1 - number_2 
        elif math_symbol == '/':
            answer = number_1 / number_2 
        elif math_symbol == '*':
            answer =number_1 * number_2
    
        print("Results: ", answer)
        response = input("Continue (Y/N)?: ")
        if response == 'N':
            print("Bye!")
            break
        else:
            info()
    

def main(): 
    display()
    number_1, number_2, math_symbol  = info()
    calculator(number_1, number_2, math_symbol)

    
if __name__ == "__main__":
    main()