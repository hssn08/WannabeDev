#pragma once
#include<iostream>

using namespace std;
void allocate(int**& p, int nrows, int ncols) {
	
	 p = new int* [nrows];
	for (int i = 0; i < nrows; ++i)
		p[i] = new int[ncols];

	for (int i = 0;i < nrows;i++) {
		for (int j = 0;j < ncols;j++) {
			p[i][j] = rand() % 10;
			cout << p[i][j] << " ";
		}
		cout << endl;
	}

	cout << endl << endl;
}
void deallocate(int**& p, int nrows, int ncols) {
	for (int i = 0;i < nrows;i++) {
		delete [] p[i];
	}

	delete[]p;
}
int* max(int** &p, int nrows, int ncols) {
	int max=0;
	int* array = new int[nrows];
	for (int i = 0;i < nrows;i++) {
		max = p[i][0];
		for (int j = 0;j < ncols;j++) {

			if (max < p[i][j]) {
				max = p[i][j];
			}
		}
		array[i] = max;
		cout << "ROW " << i << " Max is : " << max << endl;
	}
	return array;
}

int** sum(int nrows, int ncols) {
	int** matrix1 = NULL;
	int** matrix2 = NULL;
	int** matrix3 = NULL;
	allocate(matrix1, nrows, ncols);
	allocate(matrix2, nrows, ncols);
	
	matrix3 = new int* [nrows];
	for (int i = 0; i < nrows; ++i)
		matrix3[i] = new int[ncols];


	for (int i = 0;i < nrows;i++) {
		for (int j = 0;j < ncols;j++) {
			matrix3[i][j] = matrix1[i][j] + matrix2[i][j];
		}
	}

	deallocate(matrix1, nrows, ncols);
	deallocate(matrix2, nrows, ncols);

	

	for (int i = 0;i < nrows;i++) {
		for (int j = 0;j < ncols;j++) {
			cout << matrix3[i][j] << " ";
		}
		cout << endl;
	}
	
	return matrix3;
}

void allocateThreeD(int*** &p, int npages, int rows, int cols) {
	p = new int** [npages];
	for (int i = 0; i < npages; ++i) {
		p[i] = new int* [rows];
		for (int j = 0; j < rows; ++j)
			p[i][j] = new int[cols];
	}

	for (int i = 0;i < npages;i++) {
		for (int j = 0;j < rows;j++) {
			for (int k = 0;k < cols;k++) {
				p[i][j][k] = rand() % 10;
			}
		}
}

}
void deallocateThreeD(int***& p, int npages, int rows, int cols) {

	for (int i = 0;i < npages;i++)
	{
		for (int j = 0;j < rows;j++)
		{
				delete [] p[i][j] ;
		}
		delete[] p[i];
		}
	delete [] p;
}