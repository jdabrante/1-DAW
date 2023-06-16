def getint():
    error = True
    while error:
        number = input('Give me an integer number: ')
        try:
            number = int(number)
        except ValueError:
            print('Not a valid integer. Try it again!')
        else: 
            print(f'Your number is {number}')
            error = False


def getint2():
    number = input('Give me an integer number: ')
    try:
        number = int(number)
    except ValueError: 
        print('No a valid integer. Try again')
        return getint2()
    
getint2()