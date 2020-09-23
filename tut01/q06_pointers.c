struct node *a, *b, *c, *d;
a = NULL:
b = malloc(sizeof *b);
c = malloc(sizeof(struct node));
d = malloc(8); // This is not portable, may not be size of struct
c = a;
d.data = 42; // incorrect because d is a pointer to a struct node
NULL->data = 42; // c == NULL so we are dereferencing NULL

/* Discuss errors in this code
 */
