# Yuriy Fedas - Data Representation Example
def check(num):
    while (int(num) != 0):
        if ((int(num) & 3) == 3):
            return True
        else:
            num = int(num) >> 1
    # Default case when num = 0 and no consecutive bits are found
    return False

def main():
    num = input("Enter a value to check for consecutive set bits (-1 to exit): ")
    while(int(num) != -1):
        if(check(num)):
            print("The number you entered contains consecutive set bits!\n")
            num = input("Enter another value: ")
        else:
            print("The number you entered contains no consecutive set bits!\n")
            num = input("Enter another value: ")

if __name__ == '__main__':
    main()