#pragma once

#include<iostream>
using namespace std;

template<class T>

class Node {
public:
	T data;
	Node* next;

	Node(T d) {
		data = d;
		next = NULL;
	}
};
template<class T>
class Queue {
public:
	Node<T>* front;
	Node<T>* rear;

	Queue() {
		front = rear = NULL;
	}
	bool isEmpty() {
		if (front == NULL) {
			return true;
		}
		return false;
	}
	void Enqueue(T d) {
	
		Node<T>* n = new Node<T>(d);
		if (isEmpty()==true) {
			front = rear = n;
		}
		else {
			rear->next = n;
			rear = n;
		}
	}
	T Dequeue() {
	
			T data1 = front->data;
			Node<T>* temp = front;
			front = front->next;
			delete temp;
			return data1;
		
	}

	T Front() {
		if (front == NULL) {
			return 0;
		}

		return front->data;
	}

	void print() {
		Node<T>* n = front;
			while (n) {
				cout << n->data ;
				n = n->next;
			}
		}
	

};

int main() {
	Queue<int> q;
	int time = 5;
	q.Enqueue(5);
	q.Enqueue(10);
	q.Enqueue(15);
	q.Enqueue(25);

	Node<int>* temp = q.front;
	bool flag = true;
	while (flag==true) {
		if (time >= temp->data) {
			cout << "Execution time = " << temp->data << endl;
			cout << "Remaining time = " << 0 << endl;
			cout << "task is completed, dequeuing" << endl;
			
		}
		else {
			cout << "Execution time = " << temp->data << endl;
			cout << "Remaining time = " << temp->data-time << endl;
			cout << "task is not completed, rescheduling" << endl;
			q.Enqueue(temp->data - time);
		
		}
	

	

		temp = temp->next;


		q.Dequeue();

		if (temp == 0) {
			flag = false;
		}
	}
	q.print();
	

	string s = "Data Structures and Algorithm ";
	int size = 4;
	int counter = 0;
	Queue<char> array[4];
	Queue<char> p1;
	Queue<char> q1;
	int size1 = 0;
	for (int i = 0;s[i] != '\0';i++) {
		if (s[i] != 32) {
			
			p1.Enqueue(s[i]);
	}
		else {
			array[counter] = p1;
			counter++;
			p1 = q1;
		}
		size1++;
	}

	for (int i = 0;i < counter;i++) {
		Node<char>* temp1 = array[i].front;
		while (temp1) {
			q1.Enqueue(temp1->data);
			temp1 = temp1->next;
	}
	}
	cout << endl << endl << endl << endl;

	q1.print();
	cout << endl << endl << endl << endl;
}