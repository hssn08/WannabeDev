#include<iostream>
#include<unistd.h>
using namespace std; 

int main()
{
  if (fork() && fork())
  {cout<<"Hello\n"; fork();}
  if ((fork() || fork()) && fork())
  {
  cout<<"12\n";
  fork();
  cout<<"13\n";
  fork();
  cout<<"Bye\n";
  }
}
