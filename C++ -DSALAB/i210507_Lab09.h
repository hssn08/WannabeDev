#pragma once
#include<iostream>
#include <fstream>
#include<cstring>
using namespace std;

template <class T>
class node {
public:
	T val;
	node* next;
	node(T d) {
		val = d;
		next = NULL;
	}
	node() {
		val = 0;
		next = NULL;
	}
};

template <class T>
class stack {
public:
	node <T>* top;
	int size;
	stack() {
		top = NULL;
		size = 0;
	}
	void push(T  d) {
		node <T>* n = new node <T>;
		n->val = d;
		n->next = top;
		top = n;
		size = size + 1;
	}
	void pop() {
		if (!isEmpty()) {
			node <T>* n = top;
			top = top->next;
			delete n;
			size = size - 1;
		}
		
	}
	bool isEmpty() {
		if (top == NULL) {
			return true;
		}
		else
			return false;
	}
	node <T>* Peek() {
		if (!isEmpty()) {
			return top;
		}
		return NULL;
	}
	void clear() {
		while (top->next != NULL) {
			node <T>* n = top;
			top = top->next;
			delete n;
			size = size - 1;
		}
	}
	int sizeofstack() {
		return size;
	}

};
//Q2
bool validate(string filename) {
	stack<char> y;
	string x;
	string text;
	ifstream inFile(filename);
	while (getline(inFile, text)) {
		x += text;
	}
	
		inFile.close();
		for (int i = 0;i < x.length();i++) {
			if (x[i] == '{') {
				y.push('{');
			}
			else if (x[i] == '}') {
				y.pop();
			}
		}
		if (y.isEmpty()) {
			return true;
		}
		return false;

}


//Q3
class MinStack
{
public:
	stack<int> s;
	stack<int> aux;
	void push(int val) {
		s.push(val);
		if (aux.isEmpty()) {
			aux.push(val);
		}
		else {
			int value1 = aux.Peek()->val;
			if (val <= value1) {
				aux.push(val);
			}
		}
	}

	int pop() {
		if (s.isEmpty()) {
			return -1;
		}
		int value1 = s.Peek()->val;
		int value2 = aux.Peek()->val;
		if (value1 == value2) {
			aux.pop();
		}
		s.pop();
		
		return 1;
	}
	int top()
	{
		if (!s.isEmpty()) {
			return s.Peek()->val;
		}
		return -1;
	}
	int size() {
		return s.size;
	}
	bool isEmpty() {
		if (s.isEmpty()) {
			return true;
		}
		else
			return false;
	}
	int getMin() {
		return aux.Peek()->val;
	}

};