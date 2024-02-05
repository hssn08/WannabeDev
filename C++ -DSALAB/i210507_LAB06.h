#pragma once
#include<iostream>
using namespace std;
#include<iostream>
#include<conio.h>
template <class T>
class Node
{
public:
	T data;
	Node* next;

	Node()
	{
		data = 0;
		next = NULL;
	}

	Node(T d, Node* n)
	{
		n->data = d;
		
	}

	Node(T d)
	{
		data = d;
	
	}

	void setData(T d)
	{
		data = d;
	}

	void setNext(Node* n)
	{
		next = n->next;
	}

	T getData()
	{
		return data;
	}

	Node* getNext()
	{
		return next;
	}

};

template <class T>
class SLinkedList {

public:

	Node<T>* head;


	SLinkedList()
	{
		head = NULL;
	}


	void insert(T array) {
		if (head == NULL) {
			head = new Node<T>();
			head->data = array;

		}
		else {
			Node <T>* n;
			n = head;
			while (n->next != NULL) {
				n = n->next;
			}
			Node < T >* newa = new Node<T>(array);
			newa->next = NULL;
			n->next = newa;

		}
	}

	void insertAtHead(T d) {
		Node < T >* newa = new Node<T>(d);
		newa->data = d;
		newa->next = head;
		head = newa;
	}

	void InsertAtIndex(T d, int index) {
		Node < T >* n = head;
		for (int i = 0;i < index;i++) {
			n = n->next;
		}

		if (n == NULL) {
			Node < T >* newa = new Node<T>(d);
			newa->next = NULL;
			n = newa;
		}
		else {
			n->data = d;
		}
	}

	int search(T x) {
		Node < T >* n = head;
		int i = 0;
		while (n!=NULL) {
			if (n->data == x) {

				return x;
			}
			n = n->next;
			i++;
		}
		return 0;
	}

	void update(int index, T d) {
		Node < T >* n = head;
		for (int i = 0;i < index;i++) {
			n = n->next;
		}

		if (n == NULL) {
			Node < T >* newa = new Node<T>(d);
			newa->next = NULL;
			n = newa;
		}
		else {
			n->data = d;
		}
	}
	void remove(int index) {
		Node < T >* n = head;
		for (int i = 0;i < index;i++) {
			n = n->next;
		}
		n->next = n->next->next;
	}
	void print() {
		Node < T >* n = head;
		while (n != NULL) {
			cout << n->data << ",";
			n = n->next;
		}
	}

	void mergeLists(SLinkedList obj2) {
		Node < T >* n = obj2.head;
		Node <T>* k;
		k = head;
		while (k->next != NULL) {
			k = k->next;
		}
		k->next = n;

		Node <T>* l = head;

		int array[100];
		int o = 0;
		while (l != NULL) {
			array[o] = l->data;
			l = l->next;
			o++;
		}
		int temp=0;
		for (int i = 0;i < o;i++)
		{
			for (int j = i + 1;j < o;j++)
			{
				if (array[i] > array[j])
				{
					temp = array[i];
					array[i] = array[j];
					array[j] = temp;
				}
			}
		}

	
		l=head;
		o = 0;
		while (l != NULL) {
			 l->data=array[o];
			l = l->next;
			o++;
		}
	}
};
