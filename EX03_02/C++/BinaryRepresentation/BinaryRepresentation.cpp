// BinaryRepresentation.cpp : Defines the entry point for the console application.


// Yuriy Fedas - Assembly Programming - Fall 2018

#include "stdafx.h"
#include <iostream>

bool check(int num) {

	while (num != 0) {
		if ((num & 3) == 3) {
			return true;
		}
		else {
			num = num >> 1;
		}
	}
	// Default case
	return false;
}

int main()
{
	int num;
	std::cout << "Enter a number to check if its binary representation contains consecutive set bits (Enter -1 to exit): " << std::endl;
	
	while (std::cin >> num && num != -1) {
		if (check(num))
		std::cout << "The condition was satisfied!" << std::endl;
		else
		std::cout << "The condition was not satisfied!" << std::endl;

		std::cout << "\nPlease enter another integer: " << std::endl;
	}
	
}



