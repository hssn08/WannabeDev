#pragma once
#include<iostream>
using namespace std;
template <typename T>
T add(T a, T b) {
	return a + b;
}
template <typename T>
T* add(T a[5], T b[5]) {
	T* c= new T [5];
	for (int i = 0; i < 5; i++) {
		c[i] = a[i] + b[i];
	}
	return c;
}
template <typename T>
T sub(T a, T b) {
	return a - b;
}
template <typename T>
T Div(T a, T b) {
	return a / b;
}
template <typename T>
bool prime(T a) {
	for (int i = 2;i < a/2;i++) {
		if (a % i == 0) {
			return false;
		}
	}
	return true;
}
template <typename T>
T Fact(T a) {
	if (a == 0) {
		return 1;
	}
	else {
		return (a * Fact(a - 1));
	}
}
template <typename T>
T SQRT(T a) {
	return sqrt(a);
}

int SplitToSets(int* array, int size) {
	int s=0;
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < size; j++)
		{
			if (array[i] < array[j])
			{
				s = array[i];
				array[i] = array[j];
				array[j] = s;
			}
		}
	}
	int sum1=0;
	for (int i = 0;i < size / 2;i++) {
		sum1 += array[i];
	}
	int sum2 = 0;
	for (int i = size/2;i < size;i++) {
		sum2 += array[i];
	}
	return sum2 - sum1;
}

bool superString(string a) {
	bool flag = false;
	int i = 0;
	int alphabet=0;
	int count=0;
	while (a[i] != NULL) {
		for (int j = 0;a[j] != NULL;j++) {
			if (a[i] == a[j]) {
				count++;
			}
		}
		if (count == 90 - a[i] + 1) {
			flag = true;
		}
		i++;
	}
	return flag;
}

int subPalindrome(string s) {
	int size=0;
	for (int i = 0;s[i] != NULL;i++) {
		size++;
	}
	return size;
}