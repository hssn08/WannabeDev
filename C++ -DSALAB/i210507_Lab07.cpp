#include <iostream>
#include"Header.h"
using namespace std;
#include<iostream>
using namespace std;

template <class T1, class T2>
class node
{
public:
    T1 EmpID;
    T1 CNIC;
    T1 JoiningDate;
    T2 Salary;
    T2 Bonus;

public:
    node<T1, T2>* next;
    node<T1, T2>* previous;
    node(T1 id, T1 CNIC, T1 JoiningDate, T2 salary, T2 bonus)
    {
        this->EmpID = id;
        this->CNIC = CNIC;
        this->JoiningDate = JoiningDate;
        this->Salary = salary;
        this->Bonus = bonus;
    }

    void print()
    {
        cout << "ID is " << EmpID << endl;
        cout << "CNIC is " << CNIC << endl;
        cout << "Joining is " << JoiningDate << endl;
        cout << "salary is " << Salary << endl;
        cout << "bonus is " << Bonus << endl << endl << endl;
    }
};

template <class T1, class T2>
class linkList
{
public:
    node<T1, T2>* head;
    node<T1, T2>* tail;

    linkList()
    {
        head = tail = NULL;
    }

    linkList(linkList& n) {
        this->head = n->head;
        this->tail = n->tail;
    }


    void insert(T1 id, T1 CNIC, T1 JoiningDate, T2 salary, T2 bonus)
    {
        if (head == NULL)
        {
            node<T1, T2>* temporary = new node<T1, T2>(id, CNIC, JoiningDate, salary, bonus);
            head = temporary;
            tail = temporary;
            head->next = head;
            head->previous = head;
            tail->previous = tail;
            tail->next = tail;
        }
        else
        {
            node<T1, T2>* nu = new node<T1, T2>(id, CNIC, JoiningDate, salary, bonus);
            node<T1, T2>* temporary = head;


            temporary->previous = nu;
            for (int i = 0; temporary->next != head; i++)
            {
                temporary = temporary->next;
            }
            nu->next = temporary->next;
            nu->previous = temporary;
            temporary->next = nu;
            tail = nu;
        }

    }
    void search(T1 id)
    {
        node <T1, T2>* n = new node <T1, T2>;
        n = head;

        while (n != tail)
        {
            if (id == n->EmpID)
            {
                cout << "id is: " << n->EmpID << endl;
            }
            n = n->next;
        }
    }
    void UpdateSalary(T1 id, T2 newSalary)
    {
        node <T1, T2>* n = head;


        while (n != tail)
        {
            if (n->EmpID == id)
            {
                n->Salary = newSalary;
            }
            n = n->next;
        }
    }
    T2 MaxSalary()
    {
        node<T1, T2>* temporary = head;
        int i;

        for (i = 1; temporary->next != head; i++)
        {
            temporary = temporary->next;
        }
        int* array1 = new int[i], value = temporary->Salary;
        for (int j = 0; j < i; j++)
        {
            array1[j] = temporary->Salary;
            temporary = temporary->next;
        }

        for (int j = 0; j < i; j++)
        {
            if (value < temporary->Salary)
                value = temporary->Salary;
            temporary = temporary->next;
        }

        return value;
    }


    void print()
    {
        node<T1, T2>* temporary = head;
        while (temporary->next != head)
        {
            temporary->print();
            temporary = temporary->next;
        }
        temporary->print();

    }
};


int main()
{
	linkList<string, int> strin1;

	strin1.insert("12345", "12345", "12345", 12345, 12345);
	strin1.insert("12345", "12345", "12345", 12345, 12345);
	strin1.insert("12345", "12345", "12345", 12345, 12345);
	strin1.insert("12345", "12345", "12345", 12345, 12345);

	strin1.UpdateSalary("12345", 12345);

	int y = strin1.MaxSalary();

	strin1.print();

	cout << endl;

	cout << "MAX pay:  " << y  << endl;
}