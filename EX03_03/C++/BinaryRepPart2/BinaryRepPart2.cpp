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

int decrement(int num) {
	num--;
	int count = 0;

	while (num != 0) {
		if (check(num))
			count++;
		num--;
	}

	return count;
}

int main()
{
	int num;
	std::cout << "Enter an integer value to see how many numbers less than it contain consecutive significant bits: " << std::endl;
	std::cin >> num;

	std::cout << "The total amount of integers less than " << num << " was " << decrement(num) << ".\n";
}



