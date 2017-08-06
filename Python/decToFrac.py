import decimal

def gcd(a, b): # algorithm for determining the greatest common divisor
    r = a % b
    while r != 0:
        a = b
        b = r
        r = a % b
    return b

def dec_digits(n): # number of digits after decimal point
    return - decimal.Decimal(n).as_tuple().exponent

str_input = input()
power = dec_digits(str_input)
denominator = 10 ** power
numerator = float(str_input) * denominator

if numerator == denominator:
    print(1)
    exit()

if numerator > denominator:
    divideBy = gcd(numerator, denominator)
else:
    divideBy = gcd(denominator, numerator)

numerator = numerator / divideBy
denominator = denominator / divideBy

print("{0:.0f} / {1:.0f}".format(numerator, denominator))