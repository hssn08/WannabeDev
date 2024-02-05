/*
Name    :  Hassan Abbas
Roll No :  i210507
Section :  A
*/

#include <iostream>
#include<string>
#include<vector>
#include<algorithm>
#include<fstream>
using namespace std;
int V = 0;
int cont = 0;

// Generate the next permutation in lexicographic order
bool my_next_permutation(vector<int>& seq)
{
    int n = seq.size();
    int k = -1;
    // Find the smallest index k such that seq[k] < seq[k+1]
    for (int i = n - 2; i >= 0; i--) // loop through the vector from second last element to first element
    {
        if (seq[i] < seq[i + 1])
        { // if current element is smaller than the next element
            k = i;
            break;
        }
    }
    if (k == -1) {
        // Last permutation reached
        return false;
    }
    int l = -1;
    // Find the smallest index l such that seq[i] > seq[k] or largest element than seq[k]
    for (int i = n - 1; i > k; i--) // loop through the vector from last element to k+1th element
    {
        if (seq[i] > seq[k]) { // if current element is greater than seq[k]
            l = i;
            break;
        }
    }
    swap(seq[k], seq[l]); // swap seq[k] and seq[l]
    int start = k + 1, end = n - 1;
    while (start < end)
    {
        swap(seq[start], seq[end]);
        start++;
        end--;
    }
    return true; // return true to indicate that the next permutation has been generated
}

// implementation of Problem
int Problem(int** graph, int s, vector<int>& min_path_order, int arr[], int k)
{
    // store all vertex apart from source vertex for permutation
    vector<int> vertex;
    for (int i = 0; i < V; i++)
        if (i != s)
            vertex.push_back(i);

    // store minimum weight Hamiltonian Cycle.
    int min_path = 2147483647;
    do {

        // store current Path weight(cost) and order of vertices
        int current_pathweight = 0;
        vector<int> current_path_order;
        current_path_order.push_back(s);

        // compute current path weight and order of vertices
        int k = s;
        bool valid = true; // flag to indicate if the current path is valid
        for (int i = 0, c = 1; i < vertex.size(); i++, c++) {
            // check if the current edge has weight 0
            if (graph[k][vertex[i]] == 0) {
                valid = false;
                break;
            }
            current_pathweight += graph[k][vertex[i]] + arr[c];
            current_path_order.push_back(vertex[i]);
            k = vertex[i];
        }
        if (valid) {
            if (graph[k][s] == 0) {//checks that starting and ending vertices are same
                valid = false;
            }
            else {
                current_pathweight += graph[k][s];
                current_path_order.push_back(s);
            }
        }
        // update minimum path and order of vertices
        if (valid && current_pathweight < min_path) {
            min_path = current_pathweight;
            min_path_order = current_path_order;
        }

    } while (my_next_permutation(vertex));
    //used for taking all the posible combinations ( Arrangements ) of the Vertices to check which one is minimum and when largest is reached it returns false.

    if (min_path <= k)
        return min_path;

    return -1;
}

void Graph(int**& graph,string &edges,char *&verti,int *&w_arr )
{
    int k = 0;

    bool flag = false;
    for (int i = 0; i < edges.length(); i++)
    {
        if (edges[i] == '}')
            flag = false;
        if (edges[i] == '{')
            flag = true;
        else if (flag)
        {
            if (edges[i] == 'h' || edges[i] >= 'A' && edges[i] <= 'Z')
            {
                if (edges[i] == 'h' || edges[i + 2] == 'h')
                {
                    if (edges[i] == 'h')
                    {
                        int l = 0;
                        for (int k = 0; verti[k] != '\0'; k++)
                        {
                            if (edges[i + 2] == verti[k])
                            {
                                l = k;
                            }
                        }
                        graph[0][l] = w_arr[k];
                        graph[l][0] = w_arr[k];
                        k++;
                        i = i + 2;
                    }
                    else
                    {
                        int l = 0;
                        for (int k = 0; verti[k] != '\0'; k++)
                        {
                            if (edges[i] == verti[k])
                            {
                                l = k;
                            }
                        }
                        graph[0][l] = w_arr[k];
                        graph[l][0] = w_arr[k];
                        k++;
                        i = i + 2;
                    }
                }
                else
                {

                    int m = 0;
                    int l = 0;

                    for (int k = 0; verti[k] != '\0'; k++)
                    {
                        if (edges[i + 2] == verti[k])
                        {
                            l = k;
                        }
                        else if (edges[i] == verti[k])
                        {
                            m = k;
                        }

                    }
                    graph[m][l] = w_arr[k];
                    graph[l][m] = w_arr[k];
                    k++;
                    i = i + 2;
                }
            }
        }
    }
}

// main code
int main()
{
    for (int i = 1; i <= 3; i++)
    {
        string filename = "P2_test" + to_string(i);
        ifstream infile(filename + ".txt");

        cout << "---------------------------------------------- " << filename << " ------------------------------------------------\n";
        cout << "========================================================================================================\n\n";

        if (!infile) {
            cout << "Error opening file" << endl;
            return 1;
        }

        string edges, weight, vertices, delivery, limit, temp_str;

        getline(infile, vertices);

        for (int i = 0 ; vertices[i] !='\0' ; i++)
        {
            if (vertices[i] == ',')  // check if the character is a comma
            {
                V++;
            }
        }
        V++; // add one more for the last vertex

        char* verti = new char[V];
        int count = 1;

        for (int i = 0; vertices[i] != '\0'; i++)
        {
            if (vertices[i] == ',')  // check if the character is a comma
            {
                verti[count] = vertices[i + 1];
                count++;
            }
        }

        verti[count] = '\0';

        

        cout << "----------------------------------------------- VERTICES -----------------------------------------------\n";

        cout << "Number of vertices: " << V << endl;

        // matrix representation of graph
        int** graph = new int* [V];
        for (int i = 0; i < V; i++)
        {
            graph[i] = new int[V];
        }

        for (int i = 0; i < V; i++)
        {
            for (int j = 0; j < V; j++)
            {
                graph[i][j] = 0;
            }
        }

        bool flag = false;
        getline(infile, edges);
        getline(infile, weight);

        int sizee = weight.size() - 10;

        for (int i = 0; weight[i] != '\0'; i++)
        {
            if (weight[i] == ',')
                sizee--;
        }

        int* w_arr = new int[sizee];
        int k = 0;

        for (int i = 0; weight[i] != '\0'; i++)
        {
            if (weight[i] == '}')
                flag = false;
            if (weight[i] == '{')
                flag = true;
            else if (flag)
            {
                if (isdigit(weight[i]))//checks if there is a digit at i'th index
                {
                    temp_str += weight[i];//concatenate it with string
                }
                else if (weight[i] == ',')
                {
                    w_arr[k] = stoi(temp_str);//convert it into integer
                    k++;
                    temp_str = "";
                }
            }
        }
        // Handle last weight value
        if (temp_str != "") {
            w_arr[k] = stoi(temp_str);
            k++;
        }

        

        Graph(graph,edges,verti,w_arr);

        cout << "----------------------------------------------- GRAPH --------------------------------------------------\n";
        for (int i = 0; i < V; i++)
        {
            for (int j = 0; j < V; j++)
            {
                cout << graph[i][j] << "  ";
            }
            cout << endl;
        }

        int s = 0;
        vector<int> min_path_order;
        int* arr = new int[V];
        getline(infile, delivery);
        arr[0] = 0;
        k = 1;
        string token;

        for (int i = 0; i < delivery.length(); i++) {
            if (delivery[i] == '=') {
                // found an equals sign, start extracting the value
                string token = "";
                for (int j = i + 1; j < delivery.length() + 1; j++) {
                    if (delivery[j] == ',' || delivery[j] == '\0') {
                        // found the end of the value, convert token to int and store in arr
                        arr[k] = stoi(token);
                        k++;
                        token = "";
                        break;
                    }
                    else {
                        // add the current character to the token
                        token += delivery[j];
                    }
                }
            }
        }

        getline(infile, limit);
        flag = false;
        delivery = "";
        k = 0;
        for (int i = 0; limit[i] != '\0'; i++)
        {
            if (limit[i] == '=')
            {
                flag = true;
            }
            else if (flag)
                delivery += limit[i];

        }
        //cast string to int
        int num = stoi(delivery);

        //calling function to ceck for minimum hamiltonian circuit
        int min_path = Problem(graph, s, min_path_order, arr, num);

        cout << "----------------------------------------------- PATH --------------------------------------------------\n";

        if (min_path > -1)
        {
            cout << "Minimum Path: " << min_path << endl;
            cout << "Order of vertices: ";
            for (int i = 0; i < min_path_order.size(); i++) {
                if (min_path_order[i] == 0)
                    cout << "h ";
                else
                {
                    cout << verti[min_path_order[i]]<<"  ";
                }
            }
            cout << endl;
        }
        else
            cout << "NOT FEASIBLE\n";
        infile.close();

        V = 0;

        cout << endl << endl << endl;
    }

    return 0;
}