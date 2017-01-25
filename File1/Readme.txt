Your Job: 
In this assignment, you are asked to write a program in LC-3 machine language that converts a string of lower case letters into uppercase and stores the resulting value in memory.

For Example:

Input	Output
abcdefg	ABCDEFG
The addressability of the LC-3 is 16 bits; i.e., each memory location contains 16 bits of data. An ASCII code, however, is only 8 bits. To simplify your job we will only store one 0-extended ASCII code in each memory location. Your program should assume that the first character of the input string is stored in memory location x3050. Your program should store the output string in successive memory locations starting with address x3050. You may assume that the string contains only lower case alphabetic characters. That is, the string will NOT contain any spaces, punctuation, or other nasty characters. The string can be any length. We have stored a special character at the end of the string called the "NULL" character, which your program can use to detect the end of the string. The NULL character is ASCII code x00.

Your program should start at memory location x3000, and should halt the machine after storing the output. So for example, if the memory locations starting at x3050 initially contain the following values:

Address	Data
x3050	0000 0000 0110 0001
x3051	0000 0000 0110 0010
x3052	0000 0000 0110 0011
x3053	0000 0000 0110 0100
x3054	0000 0000 0110 0101
x3055	0000 0000 0110 0110
x3056	0000 0000 0110 0111
x3057	0000 0000 0000 0000
Then after your program completes executions, the memory locations starting at x3050 should contain:

Address	Data
x3050	0000 0000 0100 0001
x3051	0000 0000 0100 0010
x3052	0000 0000 0100 0011
x3053	0000 0000 0100 0100
x3054	0000 0000 0100 0101
x3055	0000 0000 0100 0110
x3056	0000 0000 0100 0111
x3057	0000 0000 0000 0000
Then your program should halt the machine.

Inside the Lab 1 folder, there will be a file named toUpper.bin. Please write your code in this file.

Hint 1: What is the difference between the ASCII code for lower case 'a' and upper case 'A'? Is this true of every character?

Hint 2: Given that your program must begin at address x3000 and that the input string begins at x3050, what is the maximum length your program can be? Is this a problem?

Hint 3: Familiarize yourself with the software and documentation, and the submission instructions well before the deadline so that you can get help from a TA if you cannot figure out the mechanics by yourself. It is unreasonable to expect Professor Patt or a TA to help you submit your program at 11:45pm on the day the program is due simply because you left this for the last minute, and have discovered that you do not know how to do it by yourself.

Simulator/Testing Hint: You can test your program by setting the value of memory locations starting with x3050 before you run your program on the LC-3 simulator. On Windows machines, you can click on "Simulate" on the menubar and select "Set Value". You can also just press F4 and the "Set Value" dialog box will pop up. Finally, double-clicking on the contents of a memory location will also cause the "Set Value" dialog box to pop up.

Make sure you set a breakpoint before you run your program so that your program will stop just before it executes the trap instruction. This will allow you to examine the contents of the locations starting at x3050 after your program has finished executing, but before control is turned over to the operating system to halt your program.

Follow the following steps:
Write your program: Type your program in the LC3Edit text editor. Your program file needs to be in plain text format. The first line of your program must specify the memory address of the first instruction of your program. For this assignment, you should place your program starting at x3000 (i.e., the first line of your program should contain the bit pattern 0011000000000000). Each subsequent line of your program will consist of 16 consecutive 0s and 1s corresponding to the bits of that instruction. For example, you would represent the instruction to add the contents of R1 to the contents of R2 and put the result in R0 by: 0001000001000010. A program represented in this way is called a .bin file.
Test your program: First convert your .bin file to an .obj file. Then load the .obj file into the LC-3 Simulator and test thoroughly by running it with multiple different input values. Read the Software and Documentation section for more help on how to use the simulator. In the real world, writing a program is never finished until the program has been thoroughly tested on lots of different input data. In fact, thorough testing separates the serious programmers from the dilettantes. Thorough testing means using odd-ball data (we call them "corner cases"), not just straightforward data.
Submit your program: The program you are to submit is the .bin file. Save your .bin file, and give it the name toUpper.bin. Follow the submission instructions for uploading your toUpper.bin file for grading.

Note: We understand that to test your program, you must first create a .obj file. The .obj file is not to be submitted for grading. We will create a .obj file from your .bin file when we grade your program.
