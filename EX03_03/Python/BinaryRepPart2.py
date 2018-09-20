# Yuriy Fedas - Data Representation Example - Part 2
def check(num):
    while (num != 0):
        if ((num & 3) == 3):
            return True
        else:
            num = num >> 1
    # Default case when num = 0 and no consecutive bits are found
    return False

def decrement(num):
    # less than the number entered
    num -= 1
    count = 0
    while (num != 0):
        if (check(num)):
            count += 1
        num -= 1
    return count

def main():
    max = input("Enter an integer value to see how many numbers less than it contain consecutive significant bits: ")
    num = int(max)
    count = decrement(num)

    print("The total amount of numbers less than",max,"was",count,".")

if __name__ == '__main__':
    main()