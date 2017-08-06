import math
user_input = int(input("N: "))
fibonacci_number = ((((1+math.sqrt(5))/2)**user_input)-(((1-math.sqrt(5))/2)**user_input))/math.sqrt(5)
print(math.floor(fibonacci_number))