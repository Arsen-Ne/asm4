#include <iostream>
#include <time.h>
using namespace std;

extern "C" int __stdcall SumMinMax(int*, int n);
extern "C" int __fastcall SumMinMax3(int*, int n);
extern "C" int __cdecl SumMinMax2(int*, int n);
extern "C" int __stdcall Min(int*, int n);
extern "C" int __cdecl Max(int*, int n);

int main()
{
    int n = 10;

    int* b = new int[n];
    srand(time(0));
    for (int i = 0; i < n; i++) {
        b[i] = rand() % 100;
        cout << b[i] << " ";
    }
    cout << endl;


    int max = 0;
    int min = 0;
    int n1 = n - 1;

    cout << "min=" << Min(b, n1) << endl;
    cout << "max=" << Max(b, n1) << endl;
    cout << "(stdcall) sum=" << SumMinMax(b, n1) << endl;  
    cout << "(cdecl) sum=" << SumMinMax2(b, n1) << endl;
    cout << "(fastcall) sum=" << SumMinMax3(b, n1) << endl;
}