#pragma once
#include<iostream>
#include<fstream>
using namespace std;
int arraySum(int array[][5], int row, int col) {
	int sum = 0;
	for (int i = 0;i < row;i++) 
	{
		for (int j = 0;j < col;j++) {
			sum += array[i][j];
		}
	}
	return sum;
}
int* rowSum(int array[][4], int row, int col) {
	int* arraysum = new int[4];


	for (int i = 0; i < 4; i++)
	{
		arraysum[i] = 0;
	}

	for (int i = 0;i < row;i++) {
		for (int j = 0;j < col;j++) {
			arraysum[i] += array[i][j];
		}
	}
	return arraysum;
}

int* colSum(int array[][4], int row, int col) {
	int* arraysum = new int[4];


	for (int i = 0; i < 4; i++)
	{
		arraysum[i] = 0;
	}

	for (int i = 0;i < row;i++) {
		for (int j = 0;j < col;j++) {
			arraysum[i] += array[j][i];
		}
	}
	return arraysum;
}

int** transposeMatrix(int array[][2], int row, int col) {
	int** tpose = new int* [row];
	for (int i = 0; i < row; i++)
		tpose[i] = new int[col];

	for (int i = 0;i < row;i++) {
		for (int j = 0;j < col;j++) {
			tpose[i][j] = array[j][i];
		}
	}
	return tpose;
}

int** matrixSum(int arr[][3], int arr1[][3], int row, int col) {
	int** tpose = new int* [row];
	for (int i = 0; i < row; i++)
		tpose[i] = new int[col];

	for (int i = 0;i < row;i++) {
		for (int j = 0;j < col;j++) {
			tpose[i][j] = arr[i][j]+arr1[i][j];
		}
	}
	return tpose;
}
 
int multiplyMatrix(int mat1[4][4], int mat2[4][4], int row1, int col1, int row2, int col2) {
	int** a = new int* [row1];
	for (int i = 0; i < row1; i++)
		a[i] = new int[col1];
	int sum = 0;
	for (int i = 0;i < row1;i++) {
		for (int j = 0;j < col1;j++) {
			for (int k = 0; k < row1;k++) {
				sum += mat1[i][j] * mat2[j][i];
			}
		}
	}
	return sum;
}

int leftDiagonalSum(int arr[][4], int row, int col) {
	int sum = 0;
	for (int i = 0;i < row;i++) {
		for (int j = 0;j < col;j++) {
			if (i == j) {
				sum += arr[i][j];
			}
		}
	}

	return sum;
}

int rightDiagonalSum(int arr[][4], int row, int col) {
	int sum = 0;
	for (int i = 0;i < row;i++) {
		for (int j = 0;j < col;j++) {
			if (i+j==row-1) {
				sum += arr[i][j];
			}
		}
	}

	return sum;
}

int* displayMiddleRow(int arr[][5], int row) {
	int* array = new int[5];
	for (int i = 0;i < 5;i++) {
		array[i] = 0;
	}

	for (int i = 0;i < row;i++) {
		for (int j = 0;j < row;j++) {
			if (i == row / 2) {
				array[j] = arr[i][j];
			}
		}
	}
	return array;
}


int* displayMiddleCol(int arr[][5], int row) {
	int* array = new int[5];
	for (int i = 0;i < 5;i++) {
		array[i] = 0;
	}

	for (int i = 0;i < row;i++) {
		for (int j = 0;j < row;j++) {
			if (j == row / 2) {
				array[i] = arr[i][j];
			}
		}
	}
	return array;
}

int* readFromFile() {

	int res[5] = { 5,5,5,5,5 };

	ofstream writea;
	writea.open("new.txt");
	for (int i = 0;i < 5;i++) {
		writea << res[i] << endl;
	}

	writea.close();

	int* sum = new int[5];
for (int i = 0;i < 5;i++) {
	sum[i] = 0;
}
ifstream reada;
reada.open("new.txt");
int counter = 0;
int vara = 0;
while (reada >> vara) {
	sum[counter] =vara ;
		counter++;
}
reada.close();
return sum;

}

int* toIntArray(string s) {
	int size = s.length();
	int* array = new int[size];

	for (int i = 0;i < s.length();i++) {
		array[i] = (s[i] - 48);
	}
	return array;
}

int* addTwoArray(string str1, string str2)
{
	int size = str1.length() + str2.length();
	int* one = toIntArray(str1);
	int* two = toIntArray(str2);
	int* result = new int[size];

	for (int i = 0; i<size; i++) {
		result[i] = one[i] + two[i];
	}
	return result;
}


int* subTwoArray(string str1, string str2)
{
	int size = str1.length() + str2.length();
	int* one = toIntArray(str1);
	int* two = toIntArray(str2);
	int* result = new int[size];

	for (int i = 0; i < size; i++) {
		result[i] = one[i] - two[i];
	}
	return result;
}
