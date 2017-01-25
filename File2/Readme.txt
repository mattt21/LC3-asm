Millionaire Professors -- There have been updates to the lab directions: 10/24/15

Overview: Now that you're almost half way through your first semester in college, you've decided that you want to become a college professor. You're friend, however, tells you that you don't want to become a professor because professors don't make any money. You try and tell him that you really want to do it for the love of the job and not the money, but that doesn't satisfy your friend. In an attempt to prove him wrong, you decide to show him a list of all the professors who have become millionaires. Fortunately you already have a list of every college professor and also another list of every millionaire.

Your Job: Write a program in LC-3 assembly language that takes as input a list of professors and a list of millionaires and produces as output a third list of professors who are millionaires. Specifically, the two input lists will be stored in memory as linked lists (described below) and the result will be 3 linked lists: professors who are not millionaires, millionaires who are not professors, and millionaire professors. Memory is tight on the LC-3 and you cannot waste space. Therefore you are not allowed to create any additional nodes to help you solve this assignment.

For Example:

Initial lists	Final lists
Professors:	Chen, Grey, Patel	Grey
Millionaires:	Brown, Chen, Patel	Brown
Millionaire Professors:	empty	Chen, Patel
The address of the first node of the list (the list head) of professors will be stored at location x4000. The address of the first node of millionaires will be stored at location x4001. You will store the address of the first node of the result at location x4002. A node will consist of two words: a pointer to the next node and the drivers license of the potential professor/millionaire. All nodes in each list will be ordered in numerical order, based on their drivers license number. We assume the State of Texas would never give two people the same drivers license number. Each of the three final lists must also be sorted in numerical order based on drivers license number (10/24/15).

The Linked-List
As discussed in class, a linked-list is a set of nodes connected to each other via pointers. In general, each node in a linked list consists of k+1 words: one word containing the next pointer and k words of data associated with the node. In this example, k=1, one word for the next pointer and one word for the drivers license.

Below we show an example of the two input lists (from above) implemented as linked-lists. For the example suppose our characters have the following drivers license numbers:
Person	Drivers license number
Brown	x0123
Chen	x4567
Grey	x89AB
Patel	xCDEF
Address	Contents	Description
x4000	x4050	The list head for the list of professors
x4001	x4100	The list head for the list of millionaires
x4002	x0000	The list head for the list of millionaire professors, initially empty
...	...	
x4050	x4150	Next-pointer
x4051	x4567	Chen's Drivers license number
...	...	
x4100	x5000	Next-pointer
x4101	x0123	Brown's Drivers license number
...	...	
x4150	x4550	Next-pointer
x4151	x89AB	Grey's Drivers license number
...	...	
x5000	x454E	Next-pointer
x5001	x4567	Chen's Drivers license number
...	...	
x454E	x0000	Next-pointer, x0000 indicates the end of the list
x454F	xCDEF	Patel's Drivers license number
x4550	x0000	Next-pointer, x0000 indicates the end of the list
x4551	xCDEF	Patel's Drivers license number
...	...	

Below is a graphical representation of the linked-list.



Notes

Your program must start at location x3000.
The linked-lists representing the professors and the millionaires are input to your program. The lists are loaded into memory before your program begins to run. Your program will only need to modify the pointers of each node. You will lose points if you modify the license numbers in the list or create new nodes in memory
Either list can initially be empty (location's x4000 or x4001 contain x0000) or your resulting list may be empty (there are no millionaire professors). Your program must work correctly in all cases.
Your program should NOT make any assumptions about the number of nodes in the list.
You can assume that the linked list will always contain a last node. I.e., a node whose next-pointer is x0000.
To help you with debugging your program, we have provided you with a test case written in assembly language. You can assemble it into an object file then load it into the simulator. Note that this test case is not comprehensive and you are responsible to test your program using other test cases. (10/30/15).


Submit your Program: The program you are to submit is the .asm file. Save your .asm file, and give it the name intersection.asm. Follow the submission instructions for uploading your intersection.asm file for grading. Be sure to submit your program in the Lab 2 directory and verify your submission.
