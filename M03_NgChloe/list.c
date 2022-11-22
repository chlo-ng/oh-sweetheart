#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include "list.h"
#include "print.h"

// Prototypes for static functions
static NODE *create_node(int data);

/** create_list
  *
  * Creates a list by allocating memory for it on the heap.
  * Be sure to initialize head and tail to NULL.
  *
  * @return pointer to an empty linked list
  */
LIST *create_list(void) {

    LIST *pList = malloc(sizeof(LIST));
    
    if (malloc(sizeof(pList)) == NULL) {
        mgba_printf("You've won... but at what cost? (Hint: your memory)");
    }

    pList->head = NULL;
    pList->tail = NULL;

    return pList;
}

/** create_node
  *
  * Helper function that creates a node by allocating memory for it on the heap.
  * Be sure to set its pointers to NULL and to set the data
  *
  * @param data integer to store in the list
  * @return pointer to a node
  */
static NODE *create_node(int data) {

    NODE *pNode = malloc(sizeof(NODE));
    if (malloc(sizeof(pNode)) == NULL) {
        mgba_printf("You've won... but at what cost? (Hint: your memory)");
    }
    
    pNode->data = data;
    pNode->prev = NULL;
    pNode->next = NULL;
    return pNode;
}

/** push_front
  *
  * Adds the data to the front of the linked list
  *
  * @param dllist a pointer to the list
  * @param data integer to store in the list
  */
void push_front(LIST *dllist, int data) {
    NODE *pnode = create_node(data);

    if (dllist->head != NULL) { // list isn't empty
        pnode->next = dllist->head;
        dllist->head->prev = pnode;
    } else { // list is empty
        dllist->tail = pnode;
    }

    dllist->head = pnode;
}

/** push_back
  *
  * Adds the data to the end of the linked list
  *
  * @param dllist a pointer to the list.
  * @param data integer to store in the list
  */
void push_back(LIST *dllist, int data) {
    NODE *newNode = create_node(data);

    if (dllist->head != NULL) {
        newNode->prev = dllist->tail;
        dllist->tail->next = newNode;
    } else {
        dllist->head = newNode;
    }
    dllist->tail = newNode;
}

/** pop_front
  *
  * Removes the node at the front of the linked list and returns its value.
  * Popping an empty list returns (POSITION) {.col = 0, .row = 0};
  *
  * @param dllist a pointer to the list.
  */
int pop_front(LIST *dllist) {
    if (dllist->head == NULL) {
        return 0;
    }
    int toReturn = dllist->head->data;
    NODE* toFree = dllist->head;
    dllist->head = dllist->head->next;
    if (dllist->head != NULL) {
        dllist->head->prev = NULL;
    }
    if (dllist->head == NULL) {
        dllist->tail = NULL;
    } 
    free(toFree);
    return toReturn;
}

/** compare
  * Compares the contents of two lists 
  * 
  * @param list1 a pointer to the first list
  * @param list2 a pointer to the second list
  * @return True (1) if lists are the same, False (0) if lists are not
  */
int compare(LIST *list1, LIST *list2) {
    
    NODE* curr1 = list1->head;
    NODE* curr2 = list2->head;
    
    while (curr1 != NULL) {
        if ((int) curr1->data == (int) curr2->data) {
            curr1 = curr1->next;
            curr2 = curr2->next;
        } else {
            return 0;
        }
    }

    return 1;
}

/** size
  * Gets the number of nodes in the linked list
  *
  * @param dllist a pointer to the list
  * @return The size of the linked list
  */
int size(LIST *dllist) {
    int size = 0;
    NODE* curr = dllist->head;
    while (curr != NULL) {
        size++;
        curr = curr->next;
    }
    return size;
}

/** empty_list
  *
  * Empties the list.  After this is called, the list should be empty.
  *
  * @param dllist a pointer to a linked list
  *
  */
void empty_list(LIST *dllist) {
    while (dllist->head != NULL) {
        pop_front(dllist);
    }
    return;
}

void print_list(LIST *list) {
    NODE* curr = list->head;

    while(curr != NULL) {
        mgba_printf("%i, ", curr->data);
        curr = curr->next;
    }

    return;
}