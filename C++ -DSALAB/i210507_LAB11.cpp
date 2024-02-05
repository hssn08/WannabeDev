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



void LevelOrder(Node* n)
{
	if (n != NULL) {
		queue <Node*> q;
		q.push(n);

		while (!q.empty())
		{
			Node* n = q.front();
			cout << n->data << "  ";
			q.pop();
			if (n->L != NULL)
			{
				q.push(n->L);

			}
			if (n->R != NULL)
			{
				q.push(n->R);

			}

		}
	}
	else {
		return;
	}
}
int main() {
	BST x;
	x.insert(25);
	x.insert(50);
	x.insert(15);
	x.insert(10);
	x.insert(4);
	x.insert(11);
	x.insert(1);
	Node* root1 = x.root;
	cout << "inorder" << endl;
	x.inorder(root1);
	cout << endl<<"preorder"<<endl;
	x.preorder(root1);
	cout << endl << "postorder"<<endl;
	x.postorder(root1);
	cout << endl<<endl;
	if (x.retreive(root1, 10) == true) {
		cout << "10 is found in retreive" << endl;
	}
	else {
		cout << "10 is not found in retreive" << endl;
	}

	cout << endl << "levelorder traverse" << endl;
	LevelOrder(root1);

}