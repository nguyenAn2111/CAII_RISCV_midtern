int main() {
    // This program calculates the factorial of 5 and the 5th Fibonacci number
    int n = 5;
    int factorial = 1;

    // factorial
    while(n != 0) {

        int temp = 0;
        int count = n;

        while(count != 0) {
            temp = temp + factorial;
            count = count - 1;
        }

        factorial = temp;
        n = n - 1;
    }

    int mem0 = factorial;   // store at memory[0x10000]

    // reset n for Fibonacci calculation
    int k = 5;
    int a = 0;
    int b = 1;

    // fibonacci
    while(k != 0) {

        int next = a + b;
        a = b;
        b = next;

        k = k - 1;
    }

    int mem1 = b;   // store at memory[0x10004]

    while(1); // infinite loop
}