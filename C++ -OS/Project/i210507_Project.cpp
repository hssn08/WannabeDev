/*
    Ahmad Dawood	(i21-0615)
    Hamza Tariq 	(i21-0707)
    Abdul Wasay 	(i21-0834)
*/
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <cmath>
#include <pthread.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/shm.h>
#include <semaphore.h>
#include <fstream>
#include <string>

using namespace std;

//---------------------------------------------------------------------------test & set---------------------------------------------------------------------------

// Function testAndSet used to lock CS to ensure one process in CS at a time
bool TestAndSet(bool *target)
{
    bool rv = *target;
    *target = true;
    return rv;
}

//--------------------------------------------------------------------------classes/structs-----------------------------------------------------------------------

pthread_mutex_t mutexLock;
double BP[2]; // For BackTracking
bool p1 = true;
bool iteration_2 = false;

class Neuron
{
public:
    double val;
    Neuron()
    {
        val = 0;
    }
};

class Layer
{
public:
    int neuron_count;
    Layer()
    {
        neuron_count = 0;
    }
    void setNeuronCount(int n)
    {
        neuron_count = n;
    }
};

double **matrix;
Layer *layers;
double val[8];
int check = 0;
double finalResult[8];
pthread_t *threadArray;
int counter = 0;
int threadcount = 0;
double *output_layer_weight;

//-------------------------------------------------------------------------file handling---------------------------------------------------------------------------------------

void setup()
{

    ifstream infile("file.txt");
    if (!infile.is_open())
    {
        cout << "Error: Unable to open file" << endl;
        return;
    }

    string line;
    bool check_val = false;
    getline(infile, line);

    // Skip the lines for previous layers
    for (int i = 0; !check_val; i++)
    {
        for (int j = 0; line[j] != '\0'; j++)
        {
            if (line[j] == 'I' && line[j + 1] == 'n' && line[j + 2] == 'p' && line[j + 3] == 'u' && line[j + 4] == 't' && line[j + 5] == ' ' && line[j + 6] == 'd' && line[j + 7] == 'a')
            {
                check_val = true;
                break;
            }
        }
        getline(infile, line);
    }

    int r = 0;
    string value_str = "";
    for (int k = 0; k < line.length(); k++)
    {
        char c = line[k];
        if (c == ',')
        {
            val[r] = stod(value_str);
            r++;
            value_str = "";
        }
        else
        {
            value_str += c;
        }
    }

    val[r] = stod(value_str);

    infile.close();

    return;
}

void output()
{

    // memory allocation
    output_layer_weight = new double[8];

    ifstream infile("file.txt");

    if (!infile.is_open())
    {
        cout << "Error: Unable to open file" << endl;
        return;
    }

    string line;
    bool check_val = false;
    getline(infile, line);

    // Skip the lines for previous layers
    for (int i = 0; !check_val; i++)
    {
        for (int j = 0; line[j] != '\0'; j++)
        {
            if (line[j] == 'O' && line[j + 1] == 'u' && line[j + 2] == 't' && line[j + 3] == 'p' && line[j + 4] == 'u' && line[j + 5] == 't' && line[j + 6] == ' ' && line[j + 7] == 'l' && line[j + 8] == 'a')
            {
                check_val = true;
                break;
            }
        }
        getline(infile, line);
    }

    for (int i = 0; i < 8; i++)
    {
        string value_str = "";
        for (int k = 0; k < line.length(); k++)
        {
            char c = line[k];
            if (c == '\0')
            {
                output_layer_weight[i] = stod(value_str);
                value_str = "";
            }
            else
            {
                value_str += c;
            }
        }

        output_layer_weight[i] = stod(value_str);

        getline(infile, line);
    }
    infile.close();
    return;
}

void filereading(int num)
{

    ifstream infile("file.txt");

    if (!infile.is_open())
    {
        cout << "Error: Unable to open file" << endl;
        return;
    }

    string line;
    // Skip the first line
    getline(infile, line);

    if (num == 0)
    {
        getline(infile, line);

        for (int i = 0; i < 8; i++)
        {
            for (int j = 0; j < 8; j++)
            {
                matrix[i][j] = 0;
            }
        }

        for (int i = 0; i < 2; i++)
        {
            int j = 0;
            string value_str = "";
            for (int k = 0; k < line.length(); k++)
            {
                char c = line[k];
                if (c == ',')
                {
                    matrix[i][j++] = stod(value_str);
                    value_str = "";
                }
                else
                {
                    value_str += c;
                }
            }

            matrix[i][j] = stod(value_str);

            getline(infile, line);
        }
    }

    else
    {
        char ind = 1;
        cout << ind;
        bool check_reading = false;

        // Skip the lines for previous layers
        for (int i = 0; !check_reading; i++)
        {
            for (int j = 0; line[j] != '\0'; j++)
            {
                if (line[j] == num + '0' && line[j + 2] == 'w')
                {
                    check_reading = true;
                    break;
                }
            }
            getline(infile, line);
        }

        // Read the weights for the current layer
        for (int i = 0; i < 8; i++)
        {
            int j = 0;
            string value_str = "";
            for (int k = 0; k < line.length(); k++)
            {
                char c = line[k];
                if (c == ',')
                {

                    {
                        matrix[i][j++] = stod(value_str);
                    }

                    value_str = "";
                }
                else
                {
                    value_str += c;
                }
            }

            matrix[i][j] = stod(value_str);

            getline(infile, line);
        }
    }

    infile.close();
}

//--------------------------------------------------------------------------------computations-----------------------------------------------------

void output_layer_compute()
{
    finalResult[0] = 0;
    for (int i = 0; i < layers[threadcount].neuron_count; i++)
    {
        finalResult[0] += val[i] * output_layer_weight[i];
        cout << val[i] << "*" << output_layer_weight[i] << " = " << finalResult[0] << endl;
    }
    cout << "FINAL OUTPUT = " << finalResult[0] << "\n\n";
}

void *network(void *args)
{
    int id = ((int)args);
    double result = 0;

    pthread_mutex_lock(&mutexLock);

    for (int i = 0; i < layers[threadcount].neuron_count; i++)
    {
        finalResult[id] += val[i] * matrix[i][id];
        cout << val[i] << "*" << matrix[i][id] << " = " << finalResult[id] << endl;
    }

    cout << "FINAL Val[" << id << "] = " << finalResult[id] << "\n\n\n";
    check++;
    pthread_mutex_unlock(&mutexLock);

    pthread_exit(NULL);
}

int num;
double receivedVal[8];

//----------------------------------------------------------------------------------logic(layers)-----------------------------------------------------------------------

void layer_func()
{
    pid_t pid;
    int fd[2];
    pipe(fd);
    int n;
    threadcount = 0;

    // Layer 1

    int fdd[2];
    pipe(fdd);
    int p2[2], p3[2], p4[2], p5[2], p6[2], p7[2], p8[2], p9[2], p10[2], out[2];
    pipe(p2);
    pipe(p3);
    pipe(p4);
    pipe(p5);
    pipe(p6);
    pipe(p7);
    pipe(p8);
    pipe(p9);
    pipe(p10);
    pipe(out);

    pid = fork();
    if (pid == 0)
    {
        filereading(threadcount);
        cout << "Number of neurons in Layer " << threadcount + 1 << endl;
        cin >> n;
        layers[threadcount + 1].setNeuronCount(n);
        int c = layers[threadcount + 1].neuron_count;
        threadArray = new pthread_t[c];
        int *idd = new int[c];
        for (int i = 0; i < c; i++)
        {
            idd[i] = i;
        }

        for (int i = 0; i < c; i++)
        {
            pthread_create(&threadArray[i], NULL, network, (void *)&idd[i]);
        }

        // wait for all threads to finish
        while (check != c)
            ;

        // write updated val to the pipe
        write(fd[1], finalResult, sizeof(finalResult));

        // create another child process to receive the result from the pipe
        counter++;
        if (counter == num)
        {
            exit(0);
        }

        // Layer 2 ( Hidden Layer )

        pid_t pid1 = fork();
        if (pid1 == 0)
        {
            threadcount++;
            filereading(threadcount);

            cout << "Number of neurons in Layer " << threadcount + 1 << endl;
            cin >> n;
            layers[threadcount + 1].setNeuronCount(n);

            // Reading from pipe

            read(fd[0], receivedVal, sizeof(receivedVal));
            cout << "Values Received from pipe of " << threadcount << endl;
            for (int i = 0; i < layers[threadcount].neuron_count; i++)
            {
                val[i] = receivedVal[i];
                cout << val[i] << " ";
            }
            cout << endl;

            idd = new int[n];
            for (int i = 0; i < n; i++)
            {
                idd[i] = i;
            }
            check = 0;
            for (int i = 0; i < n; i++)
            {
                pthread_create(&threadArray[i], NULL, network, (void *)&idd[i]);
            }

            // Busy waiting for all threads to complete their execution
            while (check != n)
                ;
            write(fd[1], finalResult, sizeof(finalResult));

            counter++;
            if (counter == num)
            {
                exit(0);
            }

            else if (counter == num - 1)
            {
                pid_t pid_out = fork();
                if (pid_out == 0)
                {
                    threadcount++;

                    read(fd[0], receivedVal, sizeof(receivedVal));
                    cout << "Values Received from pipe of " << threadcount << endl;
                    for (int i = 0; i < layers[threadcount].neuron_count; i++)
                    {
                        val[i] = receivedVal[i];
                        cout << val[i] << " ";
                    }
                    cout << endl;

                    output_layer_compute();
                    BP[0] = ((finalResult[0] * finalResult[0]) + finalResult[0] + 1) / 2;
                    BP[1] = ((finalResult[0] * finalResult[0]) - finalResult[0]) / 2;
                    cout << "F(X)= " << finalResult[0] << endl;
                    cout << "F(X1)=" << BP[0] << endl;
                    cout << "F(X2)=" << BP[1] << endl;
                    write(fd[1], BP, sizeof(BP));

                    write(out[1], "done", 4);
                }

                else
                {
                    char buffer[4];
                    read(out[0], buffer, 4);

                    if (!iteration_2)
                    {
                        double temp[2];
                        read(fd[0], temp, sizeof(temp));
                        cout << "Values Received by Back Propagation at Layer " << num << endl;
                        cout << "F(X1) = " << temp[0] << endl;
                        cout << "F(X2) = " << temp[1] << endl;
                        write(fd[1], temp, sizeof(temp));
                    }
                }
            }

            // Layer 3

            else
            {
                // create another child process to continue the network
                pid_t pid2 = fork();
                if (pid2 == 0)
                {
                    threadcount++;
                    filereading(threadcount);
                    read(fd[0], receivedVal, sizeof(receivedVal));

                    cout << "Number of neurons in Layer " << threadcount + 1 << endl;
                    cin >> n;
                    layers[threadcount + 1].setNeuronCount(n);

                    cout << "Values Received from pipe of " << threadcount << endl;
                    for (int i = 0; i < layers[threadcount].neuron_count; i++)
                    {
                        val[i] = receivedVal[i];
                        cout << val[i] << " ";
                    }
                    cout << endl;

                    idd = new int[n];
                    for (int i = 0; i < n; i++)
                    {
                        idd[i] = i;
                    }
                    check = 0;
                    for (int i = 0; i < n; i++)
                    {
                        pthread_create(&threadArray[i], NULL, network, (void *)&idd[i]);
                    }

                    while (check != n)
                        ;

                    write(fd[1], finalResult, sizeof(finalResult));

                    counter++;
                    if (counter == num)
                    {
                        exit(0);
                    }

                    /////////////////////////// Output Layer /////////////////////////

                    else if (counter == num - 1)
                    {
                        pid_t pid_out = fork();
                        if (pid_out == 0)
                        {
                            // Back_P* last;
                            threadcount++;

                            read(fd[0], receivedVal, sizeof(receivedVal));
                            cout << "Values Received from pipe of " << threadcount << endl;
                            for (int i = 0; i < layers[threadcount].neuron_count; i++)
                            {
                                val[i] = receivedVal[i];
                                cout << val[i] << " ";
                            }
                            cout << endl;

                            output_layer_compute();
                            cout << "F(X)= " << finalResult[0] << endl;
                            BP[0] = ((finalResult[0] * finalResult[0]) + finalResult[0] + 1) / 2;
                            BP[1] = ((finalResult[0] * finalResult[0]) - finalResult[0]) / 2;
                            cout << "F(X1)=" << BP[0] << endl;
                            cout << "F(X2)=" << BP[1] << endl;
                            write(fd[1], BP, sizeof(BP));
                            write(out[1], "done", 4);
                        }

                        else
                        {
                            char buffer[4];
                            read(out[0], buffer, 4);

                            if (!iteration_2)
                            {
                                double temp[2];
                                read(fd[0], temp, sizeof(temp));
                                cout << "Values Received by Back Propagation at 4 " << endl;
                                cout << "F(X1) = " << temp[0] << endl;
                                cout << "F(X2) = " << temp[1] << endl;
                                write(fd[1], temp, sizeof(temp));
                            }
                        }
                    }

                    // Layer 4

                    else
                    {
                        pid_t pid3 = fork();
                        if (pid3 == 0)
                        {
                            threadcount++;
                            filereading(threadcount);
                            read(fd[0], receivedVal, sizeof(receivedVal));

                            cout << "Number of neurons in Layer " << threadcount + 1 << endl;
                            cin >> n;
                            layers[threadcount + 1].setNeuronCount(n);

                            cout << "Values Received from pipe of " << threadcount << endl;
                            for (int i = 0; i < layers[threadcount].neuron_count; i++)
                            {
                                val[i] = receivedVal[i];
                                cout << val[i] << " ";
                            }
                            cout << endl;

                            idd = new int[n];
                            for (int i = 0; i < n; i++)
                            {
                                idd[i] = i;
                            }
                            check = 0;
                            for (int i = 0; i < n; i++)
                            {
                                pthread_create(&threadArray[i], NULL, network, (void *)&idd[i]);
                            }

                            while (check != n)
                                ;

                            write(fd[1], finalResult, sizeof(finalResult));

                            counter++;
                            if (counter == num)
                            {
                                exit(0);
                            }

                            else if (counter == num - 1)
                            {
                                pid_t pid_out = fork();
                                if (pid_out == 0)
                                {
                                    threadcount++;

                                    read(fd[0], receivedVal, sizeof(receivedVal));
                                    cout << "Values Received from pipe of " << threadcount << endl;
                                    for (int i = 0; i < layers[threadcount].neuron_count; i++)
                                    {
                                        val[i] = receivedVal[i];
                                        cout << val[i] << " ";
                                    }
                                    cout << endl;

                                    output_layer_compute();
                                    cout << "F(X)= " << finalResult[0] << endl;
                                    BP[0] = ((finalResult[0] * finalResult[0]) + finalResult[0] + 1) / 2;
                                    BP[1] = ((finalResult[0] * finalResult[0]) - finalResult[0]) / 2;
                                    cout << "F(X1)=" << BP[0] << endl;
                                    cout << "F(X2)=" << BP[1] << endl;
                                    write(fd[1], BP, sizeof(BP));
                                    write(out[1], "done", 4);
                                }

                                else
                                {
                                    char buffer[4];
                                    read(out[0], buffer, 4);

                                    if (!iteration_2)
                                    {
                                        double temp[2];
                                        read(fd[0], temp, sizeof(temp));
                                        cout << "Values Received by Back Propagation at 5 " << endl;
                                        cout << "F(X1) = " << temp[0] << endl;
                                        cout << "F(X2) = " << temp[1] << endl;
                                        write(fd[1], temp, sizeof(temp));
                                    }
                                }
                            }

                            // Layer 5

                            else
                            {
                                pid_t pid4 = fork();
                                if (pid4 == 0)
                                {
                                    threadcount++;
                                    filereading(threadcount);
                                    read(fd[0], receivedVal, sizeof(receivedVal));

                                    cout << "Number of neurons in Layer " << threadcount + 1 << endl;
                                    cin >> n;
                                    layers[threadcount + 1].setNeuronCount(n);

                                    cout << "Values Received from pipe of " << threadcount << endl;
                                    for (int i = 0; i < layers[threadcount].neuron_count; i++)
                                    {
                                        val[i] = receivedVal[i];
                                        cout << val[i] << " ";
                                    }
                                    cout << endl;

                                    idd = new int[n];
                                    for (int i = 0; i < n; i++)
                                    {
                                        idd[i] = i;
                                    }
                                    check = 0;
                                    for (int i = 0; i < n; i++)
                                    {
                                        pthread_create(&threadArray[i], NULL, network, (void *)&idd[i]);
                                    }

                                    while (check != n)
                                        ;

                                    write(fd[1], finalResult, sizeof(finalResult));

                                    counter++;
                                    if (counter == num)
                                    {
                                        exit(0);
                                    }

                                    else if (counter == num - 1)
                                    {
                                        pid_t pid_out = fork();
                                        if (pid_out == 0)
                                        {

                                            threadcount++;

                                            read(fd[0], receivedVal, sizeof(receivedVal));
                                            cout << "Values Received from pipe of " << threadcount << endl;
                                            for (int i = 0; i < layers[threadcount].neuron_count; i++)
                                            {
                                                val[i] = receivedVal[i];
                                                cout << val[i] << " ";
                                            }
                                            cout << endl;

                                            output_layer_compute();
                                            BP[0] = ((finalResult[0] * finalResult[0]) + finalResult[0] + 1) / 2;
                                            BP[1] = ((finalResult[0] * finalResult[0]) - finalResult[0]) / 2;
                                            cout << "F(X)= " << finalResult[0] << endl;
                                            cout << "F(X1)=" << BP[0] << endl;
                                            cout << "F(X2)=" << BP[1] << endl;
                                            write(fd[1], BP, sizeof(BP));
                                            write(out[1], "done", 4);
                                        }

                                        else
                                        {
                                            char buffer[4];
                                            read(out[0], buffer, 4);

                                            if (!iteration_2)
                                            {
                                                double temp[2];
                                                read(fd[0], temp, sizeof(temp));
                                                cout << "Values Received by Back Propagation at 6 " << endl;
                                                cout << "F(X1) = " << temp[0] << endl;
                                                cout << "F(X2) = " << temp[1] << endl;
                                                write(fd[1], temp, sizeof(temp));
                                            }
                                        }
                                    }

                                    // Layer 6

                                    else
                                    {
                                        pid_t pid5 = fork();
                                        if (pid5 == 0)
                                        {
                                            threadcount++;
                                            filereading(threadcount);
                                            read(fd[0], receivedVal, sizeof(receivedVal));

                                            cout << "Number of neurons in Layer " << threadcount + 1 << endl;
                                            cin >> n;
                                            layers[threadcount + 1].setNeuronCount(n);

                                            cout << "Values Received from pipe of " << threadcount << endl;
                                            for (int i = 0; i < layers[threadcount].neuron_count; i++)
                                            {
                                                val[i] = receivedVal[i];
                                                cout << val[i] << " ";
                                            }
                                            cout << endl;

                                            idd = new int[n];
                                            for (int i = 0; i < n; i++)
                                            {
                                                idd[i] = i;
                                            }
                                            check = 0;
                                            for (int i = 0; i < n; i++)
                                            {
                                                pthread_create(&threadArray[i], NULL, network, (void *)&idd[i]);
                                            }

                                            while (check != n)
                                                ;

                                            write(fd[1], finalResult, sizeof(finalResult));

                                            counter++;
                                            if (counter == num)
                                            {
                                                exit(0);
                                            }

                                            else if (counter == num - 1)
                                            {
                                                pid_t pid_out = fork();
                                                if (pid_out == 0)
                                                {

                                                    threadcount++;

                                                    read(fd[0], receivedVal, sizeof(receivedVal));
                                                    cout << "Values Received from pipe of " << threadcount << endl;
                                                    for (int i = 0; i < layers[threadcount].neuron_count; i++)
                                                    {
                                                        val[i] = receivedVal[i];
                                                        cout << val[i] << " ";
                                                    }
                                                    cout << endl;

                                                    output_layer_compute();

                                                    BP[0] = ((finalResult[0] * finalResult[0]) + finalResult[0] + 1) / 2;
                                                    BP[1] = ((finalResult[0] * finalResult[0]) - finalResult[0]) / 2;
                                                    cout << "F(X)= " << finalResult[0] << endl;
                                                    cout << "F(X1)=" << BP[0] << endl;
                                                    cout << "F(X2)=" << BP[1] << endl;
                                                    write(fd[1], BP, sizeof(BP));
                                                    write(out[1], "done", 4);
                                                }

                                                else
                                                {
                                                    char buffer[4];
                                                    read(out[0], buffer, 4);

                                                    if (!iteration_2)
                                                    {
                                                        double temp[2];
                                                        read(fd[0], temp, sizeof(temp));
                                                        cout << "Values Received by Back Propagation at 7 " << endl;
                                                        cout << "F(X1) = " << temp[0] << endl;
                                                        cout << "F(X2) = " << temp[1] << endl;
                                                        write(fd[1], temp, sizeof(temp));
                                                    }
                                                }
                                            }

                                            // Layer 7

                                            else
                                            {
                                                pid_t pid6 = fork();
                                                if (pid6 == 0)
                                                {
                                                    threadcount++;
                                                    filereading(threadcount);
                                                    read(fd[0], receivedVal, sizeof(receivedVal));

                                                    cout << "Number of neurons in Layer " << threadcount + 1 << endl;
                                                    cin >> n;
                                                    layers[threadcount + 1].setNeuronCount(n);

                                                    cout << "Values Received from pipe of " << threadcount << endl;
                                                    for (int i = 0; i < layers[threadcount].neuron_count; i++)
                                                    {
                                                        val[i] = receivedVal[i];
                                                        cout << val[i] << " ";
                                                    }
                                                    cout << endl;

                                                    idd = new int[n];
                                                    for (int i = 0; i < n; i++)
                                                    {
                                                        idd[i] = i;
                                                    }
                                                    check = 0;
                                                    for (int i = 0; i < n; i++)
                                                    {
                                                        pthread_create(&threadArray[i], NULL, network, (void *)&idd[i]);
                                                    }

                                                    while (check != n)
                                                        ;

                                                    write(fd[1], finalResult, sizeof(finalResult));

                                                    counter++;
                                                    if (counter == num)
                                                    {
                                                        exit(0);
                                                    }

                                                    else if (counter == num - 1)
                                                    {
                                                        pid_t pid_out = fork();
                                                        if (pid_out == 0)
                                                        {

                                                            threadcount++;

                                                            read(fd[0], receivedVal, sizeof(receivedVal));
                                                            cout << "Values Received from pipe of " << threadcount << endl;
                                                            for (int i = 0; i < layers[threadcount].neuron_count; i++)
                                                            {
                                                                val[i] = receivedVal[i];
                                                                cout << val[i] << " ";
                                                            }
                                                            cout << endl;

                                                            output_layer_compute();

                                                            BP[0] = ((finalResult[0] * finalResult[0]) + finalResult[0] + 1) / 2;
                                                            BP[1] = ((finalResult[0] * finalResult[0]) - finalResult[0]) / 2;
                                                            cout << "F(X)= " << finalResult[0] << endl;
                                                            cout << "F(X1)=" << BP[0] << endl;
                                                            cout << "F(X2)=" << BP[1] << endl;
                                                            write(fd[1], BP, sizeof(BP));
                                                            write(out[1], "done", 4);
                                                        }

                                                        else
                                                        {
                                                            char buffer[4];
                                                            read(out[0], buffer, 4);

                                                            if (!iteration_2)
                                                            {
                                                                double temp[2];
                                                                read(fd[0], temp, sizeof(temp));
                                                                cout << "Values Received by Back Propagation at 8 " << endl;
                                                                cout << "F(X1) = " << temp[0] << endl;
                                                                cout << "F(X2) = " << temp[1] << endl;
                                                                write(fd[1], temp, sizeof(temp));
                                                            }
                                                        }
                                                    }

                                                    // Layer 8

                                                    else
                                                    {
                                                        // NO More Layers
                                                    }

                                                    write(p7[1], "done", 4);
                                                    exit(0);
                                                }

                                                else
                                                {
                                                    char buffer2[4];
                                                    read(p7[0], buffer2, 4);
                                                    if (!iteration_2)
                                                    {
                                                        double temp[2];
                                                        read(fd[0], temp, sizeof(temp));
                                                        cout << "Values Received by Back Propagation at Layer 6" << endl;
                                                        cout << "F(X1) = " << temp[0] << endl;
                                                        cout << "F(X2) = " << temp[1] << endl;
                                                        write(fd[1], temp, sizeof(temp));
                                                    }
                                                }
                                            }

                                            write(p6[1], "done", 4);
                                            exit(0);
                                        }

                                        else
                                        {
                                            char buffer2[4];
                                            read(p6[0], buffer2, 4);
                                            if (!iteration_2)
                                            {
                                                double temp[2];
                                                read(fd[0], temp, sizeof(temp));
                                                cout << "Values Received by Back Propagation at Layer 6" << endl;
                                                cout << "F(X1) = " << temp[0] << endl;
                                                cout << "F(X2) = " << temp[1] << endl;
                                                write(fd[1], temp, sizeof(temp));
                                            }
                                        }
                                    }

                                    write(p5[1], "done", 4);
                                    exit(0);
                                }
                                // Parent Layer 5

                                else
                                {
                                    char buffer2[4];
                                    read(p5[0], buffer2, 4);
                                    if (!iteration_2)
                                    {
                                        double temp[2];
                                        read(fd[0], temp, sizeof(temp));
                                        cout << "Values Received by Back Propagation at Layer 5" << endl;
                                        cout << "F(X1) = " << temp[0] << endl;
                                        cout << "F(X2) = " << temp[1] << endl;
                                        write(fd[1], temp, sizeof(temp));
                                    }
                                }
                            }

                            write(p4[1], "done", 4);
                            exit(0);
                        }

                        // Parent Layer 4

                        else
                        {
                            char buffer2[4];
                            read(p4[0], buffer2, 4);
                            if (!iteration_2)
                            {
                                double temp[2];
                                read(fd[0], temp, sizeof(temp));
                                cout << "Values Received by Back Propagation at Layer 4" << endl;
                                cout << "F(X1) = " << temp[0] << endl;
                                cout << "F(X2) = " << temp[1] << endl;
                                write(fd[1], temp, sizeof(temp));
                            }
                        }
                    }

                    write(p3[1], "done", 4);
                    exit(0);
                }

                // Parent Layer 3

                else
                {
                    char buffer2[4];
                    read(p3[0], buffer2, 4);
                    if (!iteration_2)
                    {
                        double temp[2];
                        read(fd[0], temp, sizeof(temp));
                        cout << "Values Received by Back Propagation at Layer 3" << endl;
                        cout << "F(X1) = " << temp[0] << endl;
                        cout << "F(X2) = " << temp[1] << endl;
                        write(fd[1], temp, sizeof(temp));
                    }
                }
            }

            write(p2[1], "done", 4);
            exit(0);
        }

        // Parent Layer 2

        else
        {
            char buffer2[4];
            read(p2[0], buffer2, 4);
            if (!iteration_2)
            {
                double temp[2];
                read(fd[0], temp, sizeof(temp));
                cout << "Values Received by Back Propagation at Layer 2" << endl;
                cout << "F(X1) = " << temp[0] << endl;
                cout << "F(X2) = " << temp[1] << endl;
                write(fd[1], temp, sizeof(temp));
            }
        }
        write(fdd[1], "done", 4);
        exit(0);
    }

    // Parent Layer 1

    else
    {
        // parent process
        char buffer[4];
        read(fdd[0], buffer, 4);

        if (!iteration_2)
        {
            double temp[2];

            read(fd[0], temp, sizeof(temp));
            cout << "Values Received by Back Propagation at Layer 1" << endl;
            cout << "F(X1) = " << temp[0] << endl;
            cout << "F(X2) = " << temp[1] << endl;

            cout << "Updating the Inputs Values Accorinding to the Values Received through Back Propagation\n";

            val[0] = temp[0];
            val[1] = temp[1];
        }
    }

    return;
}

//-------------------------------------------------------------------------------------Main -------------------------------------------------------------------

int main()
{

    // allocate memory for matrix
    matrix = new double *[8];
    for (int i = 0; i < 8; i++)
    {
        matrix[i] = new double[8];
    }

    setup();

    output();
    int n;
    cout << "Enter the number of layers: ";
    cin >> num;
    layers = new Layer[num];
    layers[0].setNeuronCount(2);
    layers[num - 1].setNeuronCount(1);

    layer_func();
    iteration_2 = true;
    layer_func();

    return 0;
}