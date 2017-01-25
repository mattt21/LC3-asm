Statement Evaluation -- There have been changes to the assignment as of 11/9/15

Overview: Now that you know how lucrative it can be to become a professor, you are eager to continue your education. Your friend now tells you about the exciting world beyond assembly language. They tell you that when you program in a high level language, you can combine multiple arithmetic operations in a single construct, known as an assignment statement. An assignment statement can be quite complex and may need to be translated into many machine language instructions before the computer can carry out the work specified by it. 

Your Job: In this lab, you are asked to write a program in LC-3 assembly language that takes as input an assignment statement and produces as output the result of carrying out all the operations specified in the assignment statement. For example, for each of the assignment statements shown below, the output would be as shown.

Assignment Statement	Output
y=5;	5
y=(5+2);	7
y=(7-(2*3));	1 A typo in the table was fixed at 11/13/15
y=((2-5)*(4+2));	-18
An assignment statement is of the form y=E;, where E is an expression. Note that the assignment statement terminates with a ";".
An expression can be either a single decimal digit, or it can be of the form ( E Operation E ). Note that if an expression is not a single decimal digit, then it must be surrounded by parentheses. Operation is either +, for add, -, for subtract, or *, for multiplication.

Input for your program is the assignment statement stored as a character string in memory, starting at location x4003. Each location will contain the ascii code for a single character: Each character will be either a decimal digit, (, ), +, -, *, or ;

Your program will evaluate the expression and store the result in location x4000. You should store the result as a 2's complement integer.

You may assume that the character string stored in locations starting at x4003 is a proper assignment statement. That is, each statement will follow the rules specified above.

The simplest way to solve this problem is with a stack. Therefore, you are required to use a stack. Location x4001 will contain the starting address of the PUSH routine, and location x4002 will contain the starting address of the POP routine. The PUSH and POP routines will work as discussed in class; that is, R6 will be the stack pointer (initiallized by your program) and R5 will return the status (success or failure) of each stack operation. Data will be transferred between your main program and the stack via R0. (Added 11/9/15). The first element pushed on the stack will be stored in xFDFF, and the stack will grow toward x0000. Question: What value should the stack pointer be initialized to?

Note that in order to test your program you will need to write your own PUSH and POP routines. During grading, however, we will use our own PUSH and POP routines, so it is important you do not make any assumptions about how the routines work other than what has been provided.

Some hints:

This character string does NOT terminate with the NULL character. How do you know when you have reached the end of the expression?
The simplest way to solve this lab is with a stack. If you successively push input characters on the stack, then when you see a ), you know the top of the stack must contain 




If you pop those four elements, perform the operation on the operands, and push the result, you are ready to move on to the next character in the input string.
What if the first character in your input string is NOT a (? What does that mean?
How do you know when you have completely evaluated the expression and are ready to store the result in x4000.
Since {+,-,*} operate on 2's-complement integers, characters in the input string that are ASCII codes of decimal digits should first be converted to 2's-complement integers before pushing them onto the stack.
Bonus (10 points): Suppose the input string is not formed properly! If there is an error in the input string (e.g., too many left parentheses), print the following prompt to the screen EXACTLY as it appears below: 

BAD EXPRESSION! 

You may always assume the assignment statement terminates with a semicolon.

Submit your program: The program you are to submit is the .asm file. Save your .asm file, and give it the name stack.asm. Follow the submission instructions for uploading your stack.asm file for grading. There is no need to submit your PUSH and POP routines.
Note: We understand that to test your program, you must first create a .obj file. The .obj file is not to be submitted for grading. We will create a .obj file from your .asm file when we grade your program.
