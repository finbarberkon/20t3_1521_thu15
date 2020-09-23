int  x;  // a variable located at address 1000 with initial value 0
int *p;  // a variable located at address 2000 with initial value 0

/* If each of the following statements is executed in turn, starting from the
 * above state, show the value of both variables after each statement: */

p = &x;         // x == ?, p == ?

x = 5;          // x == ?, p == ?

*p = 3;         // x == ?, p == ?

x = (int)p;     // x == ?, p == ?

x = (int)&p;    // x == ?, p == ?

p = NULL;       // x == ?, p == ?

*p = 1;         // x == ?, p == ?
