#ifndef LIST_H
#define LIST_H

// Struct for a node for a doubly-linked list
typedef struct dlnode {
	struct dlnode* prev;
	struct dlnode* next;
	int data;
} NODE;

// Struct for a doubly-linked list
typedef struct dllist {
	struct dlnode *head;
	struct dlnode *tail;
} LIST; 

// Typedef for function pointer to fn that takes in a void * and return int *
typedef int (*list_operation)(int x);


// ---- Prototypes ----

// Create a new list
LIST *create_list(void);

// Add a new element to the list
void push_front(LIST *dllist, int data);
void push_back(LIST *dllist, int data);

// Remove a node from the list and returns its data
int pop_front(LIST *dllist);

// Compare two lists
int compare(LIST *list1, LIST *list2);

// Get the size of the linked list
int size(LIST *dllist);

// Clear out a list and free all nodes, but not the list itself
void empty_list(LIST *dllist);

void print_list(LIST *list);


#endif
