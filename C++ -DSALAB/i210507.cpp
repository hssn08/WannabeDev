#include<iostream>
using namespace std;
#include<ctime>
#include "Header.h"
int main() {
	//Question 1a
	int** ptr = NULL;

	int row, col,npages;
	cout << "Enter rows: ";
	cin >> row;
	cout << "Enter cols: ";
	cin >> col;
	cout << "Enter npages: ";
	cin >> npages;
	allocate(ptr, row, col);
	//Question 1b
	deallocate(ptr, row, col);


	//QUESTION 2a
	allocate(ptr, row, col);
	max(ptr, row, col);

	//Question 2b
	sum(row, col);

	int*** p = NULL;
	//Question 3a
	allocateThreeD(p, npages, row, col);
	//Question 3b
	deallocateThreeD(p, npages, row, col);
}