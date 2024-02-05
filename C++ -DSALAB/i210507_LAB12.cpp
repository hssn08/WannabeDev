#include<iostream>
using namespace std;
#include<queue>
class Node {
public:
	int data;
	Node* L;
	Node* R;
	Node(int data) {
		this->data = data;
		L = NULL;
		R = NULL;
	}
	Node() {
		this->data = 0;
		L = NULL;
		R = NULL;
	}
};

class BST {
public:
	Node* root;
	BST() {
		root = NULL;
	}
	void insert(int d) {
		if (retreive(root, d) == false) {
			return;
		}

		Node* n = new Node(d);
		if (root == NULL) {
			root = n;

		}
		else {
			Node* t = root;
			while (t != NULL) {
				if (d > t->data) {
					//cout << d << " ";
					if (t->R == NULL) {
						t->R = n;
						return;
					}

					else {
						t = t->R;
					}
				}
				else if (d < t->data) {
					//cout << d << " ";
					if (t->L == NULL) {
						t->L = n;
						return;
					}
					else {
						t = t->L;
					}
				}
				else {

				}
			}
		}
	}
	bool retreive(Node* root, int data2)
	{
		if (root != NULL)
		{
			retreive(root->L, data2);

			if (root->data == data2) {
				return false;
			}

			retreive(root->R, data2);
		}
		else {
			return true;
		}
	}


	void preorder(Node* root)
	{
		if (root != NULL)
		{
			cout << root->data << "  ";
			preorder(root->L);
			preorder(root->R);

		}
	}
	void postorder(Node* root)
	{
		if (root != NULL)
		{
			postorder(root->L);
			postorder(root->R);
			cout << root->data << "  ";

		}
	}
	void inorder(Node* root)
	{
		if (root != NULL)
		{

			inorder(root->L);
			cout << root->data << "  ";
			inorder(root->R);

		}
	}


};

int main()
{
	BST t;
	t.insert(5);
	t.insert(8);
	t.insert(3);
	t.insert(9);
	t.insert(12);
	t.insert(4);
	t.insert(3);
	t.insert(2);
	t.insert(1);

}
