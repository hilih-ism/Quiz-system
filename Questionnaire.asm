                                     ;This project is made for making questionnaire easier to conduct and it gives information about the given answers if the answers are correct or not and finally display the total score.
.MODEL SMALL
.STACK 100H

.DATA    
;Data part of the program
MSG1 DB '                .....WELCOME TO MICROPROCESSOR AND ASSEMBLY LANGUAGE  QUIZ.....$'
MSG2 DB 'Rules : $'
MSG3 DB '*. For Every Correct answer you will get 1 point.$'
MSG4 DB '*. For Every Wrong answer 1 Point will cut from your total point.$'
MSG5 DB 'Press Enter to start the quiz : $'
MSG6 DB 'Right Answer....$';returned if the answer to the question is correct
MSG7 DB 'Wrong Answer....$';returned if the answer to the question is wrong
MSG8 DB 'You have successfully completed your quiz.$'
MSG9 DB 'Your Total obtained point is : $';concatinated with the method calculating the total number of correct answers
MSG10 DB 'Press 1 to Re-attempt quiz or 0 to Exit.$' ;press 1 to retry or press 0 to exit the program
MSG11 DB '                    ***Thank you.! ***$'
Q1 DB '1). Microprocessor is a unit that controls ___________.$';question 1
QA1 DB '   a) Microcomputer    b) Marco computer    c) Input-output devices$';choice for the first question
Q2 DB '2). ALU stands for ________.$';question 2
QA2 DB '   a) Addition logic unit    b) Arithmetic logical unit    c) Adders logic unit$';choice for the second question
Q3 DB '3). What is the function of ALU?$';question 3
QA3 DB '   a) Used to perform arithmetic operations    b) Used to perform logical operations   c) Both a and b$';choice for the third question
Q4 DB '4). Which of the following sequence that a microprocessor follows?$';question 4
QA4 DB 'a) Fetch, execute, decode    b) Fetch, decode, execute    c) Decode, fetch, execute$';choice for the fourth question
Q5 DB '5). Initially the microprocessors stores instructions in ______ order in a memory.$';question 5
QA5 DB '   a) Sequential manner    b) Concurrent manner    c) Both a and b$';choice for the fifth question
Q6 DB '6). Instructions in a microprocessor, are fetched from _________.$';question 6
QA6 DB '   a) CPU    b) ALU    c) Memory$';choice for the sixth question
Q7 DB '7). Microprocessor continues to execute the instruction until it reaches _______ instruction$';question 7
QA7 DB '   a) Start    b) Stop    c) Continue$';choice for the seventh question
Q8 DB '8). When a microprocessor reaches a stop instruction it responds back in _______ format to the ports output.$';question 8
QA8 DB '   a) Binary    b) 0s and 1s    c) Both b and c$';choice for the eighth question
Q9 DB '9). Microprocessor understands a set of instructions called ________.$';question 9
QA9 DB '   a) Instruction set    b) Software    c) Code$';choice for the ninth question
Q10 DB '10). A single instruction processes number of bits in a processor it is called ______.$';question 10
QA10 DB '   a) Clock speed    b) Bandwidth     c) Instruction processor$';choice for the tenth question
.CODE                        ;the code part of the program
MAIN PROC                    ;the main procedure
    
    MOV AX,@DATA                   ;@DATA    ;declaring all the data given in the above section
	MOV DS,AX
    
	LEA DX,MSG1                    ;displaying the welcome message 
	MOV AH,9
	INT 21H
	
	CALL NL                        ;new line
    
	LEA DX,MSG2                    ;displaying rules: message
	MOV AH,9
	INT 21H
    
	CALL NL                        ;newline
    
	LEA DX,MSG3                    ;displaying *. For Every Correct answer you will get 1 point. message
	MOV AH,9
	INT 21H
    
    CALL NL                        ;new line
    
	LEA DX,MSG4                    ;displaying *. For Every Wrong answer 1 Point will cut from your total point. message
	MOV AH,9
	INT 21H
	
	START:
	MOV BL, 0  
    CALL NL                        ;new line
    
	LEA DX,MSG5                    ;displaying Press Enter to start the quiz : message
	MOV AH,9
	INT 21H
	
	
	MOV AH, 1
	INT 21H
	
	CMP AL, 0DH              ;comparing entry with the "ENTER" key if not equal repeat the loop until correct entry 
	JE QSN1                  ;jump equivalent condition
	JNE START                ;jump not equivalent condition
	
	QSN1:                    ;question number 1 
	CALL NL                  ;new line 
    
	LEA DX,Q1                ;priting question number 1
	MOV AH,9
	INT 21H                 
	
	CALL NL                  ;new line 
    
	LEA DX,QA1               ;printing choices for question number 1
	MOV AH,9
	INT 21H
	
	CALL NL                  ;new line
    
	MOV AH, 1
	INT 21H
	CMP AL, 'a'              ;compare our answer with the correct answer
	JE QSN2                  ;move to the next question
    JNE QSNW2
	
	QSN2:                    ;question number 2 in the right case
	CALL NL                  ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                   ;increment the score
	CALL NL
    
	CALL QN2                 ;calling Question Number 2
	
	CALL INPUT               ;calling our input
	
	CMP AL, 'b'              ;compare the input with the correct answer
	JE QSN3                  ;calling question number 3
	JNE QSNW3
	
	QSNW2:                    ;question number 2 in the wrong case
	CALL NL
	CALL NL
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL                    ;decrement the total score by 1
	CALL NL
    
	CALL QN2 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN3 
	JNE QSNW3
	
	
	QSN3:                    ;question number 3 in the right case
	CALL NL
	CALL NL
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                  ;increment the score by 1
	CALL NL    

    
	CALL QN3 
	CALL INPUT
	
	CMP AL, 'c'                ;comparing user input with the correct answer
	JE QSN4
	JNE QSNW4
	
	QSNW3:                    ;question number 3 in the wrong case
	CALL NL                   ;new line        
	CALL NL                   ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL
	CALL NL                    ;new line
    
	CALL QN3
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN4 
	JNE QSNW4
	
	QSN4:                    ;question number 4 in the right case
	CALL NL                  ;new line
	CALL NL                  ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                     ;increment the score by 1
	CALL NL                    ;new line
    
	CALL QN4 
	CALL INPUT
	
	CMP AL, 'b'                ;comparing user input with the correct answer
	JE QSN5
	JNE QSNW5
	
	QSNW4:                    ;question number 4 in the wrong case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL                    ;decrement the total score by 1
	CALL NL                   ;new line
    
	CALL QN4 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN5 
	JNE QSNW5
	
	QSN5:                    ;question number 5 in the right case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                    ;increment the total score by 1
	CALL NL                   ;new line
    
	CALL QN5 
	
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN6
	JNE QSNW6
	
	QSNW5:                    ;question number 5 in the wrong case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL                    ;decrement the total score by 1
	CALL NL                   ;new line
    
	CALL QN5 
	CALL INPUT
	
	CMP AL, 'a'                ;comparing user input with the correct answer
	JE QSN6 
	JNE QSNW6
	
	QSN6:                    ;question number 6 in the right case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                    ;increment the total score by 1
	CALL NL                   ;new line
    
	CALL QN6 
	
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN7
	JNE QSNW7
	
	QSNW6:                    ;question number 6 in the wrong case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL                    ;decrement the total score by 1
	CALL NL                   ;new line
    
	CALL QN6 
	CALL INPUT
	
	CMP AL, 'c'                ;comparing user input with the correct answer
	JE QSN7 
	JNE QSNW7
	
	QSN7:                    ;question number 7 in the right case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                    ;increment the total score by 1
	CALL NL                   ;new line
    
	CALL QN7
	CALL INPUT
	
	CMP AL, 'b'                ;comparing user input with the correct answer
	JE QSN8
	JNE QSNW8
	
	QSNW7:                    ;question number 7 in the wrong case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL                    ;decrement the total score by 1
	CALL NL                   ;new line
    
	CALL QN7 
	CALL INPUT
	
	CMP AL, 'b'                ;comparing user input with the correct answer
	JE QSN8 
	JNE QSNW8
	
	QSN8:                    ;question number 8 in the right case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                    ;increment the total score by 1
	CALL NL                   ;new line
    
	CALL QN8 
	CALL INPUT
	
	CMP AL, 'c'                ;comparing user input with the correct answer               
	JE QSN9
	JNE QSNW9
	
	QSNW8:                    ;question number 8 in the wrong case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL                    ;decrement the total score by 1
	CALL NL                   ;new line
    
	CALL QN8 
	CALL INPUT
	
	CMP AL, 'c'                ;comparing user input with the correct answer
	JE QSN9 
	JNE QSNW9
	
	QSN9:                    ;question number 9 in the right case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                     ;decrement the total score by 1                    
	CALL NL                   ;new line
    
	CALL QN9 
	CALL INPUT
	
	CMP AL, 'a'                ;comparing user input with the correct answer
	JE QSN10
	JNE QSNW10
	
	QSNW9:                    ;question number 9 in the wrong case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	            
	DEC BL                    ;decrement the total score by 1
	CALL NL                   ;new line
    
	CALL QN9 
	CALL INPUT
	
	CMP AL, 'a'                ;comparing user input with the correct answer
	JE QSN10 
	JNE QSNW10
	
	QSN10:                    ;question number 10 in the right case
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                    ;decrement the total score by 1
	CALL NL                   ;new line
    
	CALL QN10 
	CALL INPUT
	
	CMP AL, 'a'                ;comparing user input with the correct answer
	JE EXIT
	JNE EXITW
	
	QSNW10:                    ;question number 10 in the right case
	CALL NL                    ;new line
	CALL NL                    ;new line
    
	LEA DX,MSG7
	MOV AH,9
	INT 21H
	
	DEC BL                    ;decrement the total score by 1
	CALL NL                    ;new line
    
	CALL QN10 
	CALL INPUT
	
	CMP AL, 'a'
	JE EXIT 
	JNE EXITW
	
	EXIT:
	CALL NL                   ;new line
    
	LEA DX,MSG6
	MOV AH,9
	INT 21H
	
	INC BL                    ;increment the total score by 1
	CALL NL                   ;new line
	CALL NL                   ;new line
    
	LEA DX,MSG8
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,MSG9
	MOV AH,9
	INT 21H
	
	ADD BL, 48
	
	CMP BL,57
	JG TEN
	MOV AH, 2
	MOV DL, BL
	INT 21H
	JMP EXIT1
	
	EXITW:                    ;exit with wrong answer and decrementing the total score
	CALL NL                   ;new line
    
	LEA DX,MSG7                 ;displating the message wrong answer.....                                     
	MOV AH,9
	INT 21H
	
	DEC BL                      ;decrement the total score by 1
	CALL NL                     ;new line
	CALL NL                     ;new line

    
	LEA DX,MSG8                 ;displating the message you have successfully completed your quiz
	MOV AH,9
	INT 21H 
	
	CALL NL                   ;new line
    CALL NL                   ;new line
    
	LEA DX,MSG9                 ;displating the message your total obtained point is:
	MOV AH,9
	INT 21H
	
	ADD BL,48
	MOV AH,2
	MOV DL, BL
	INT 21H
	
	JMP EXIT1
	
	TEN:                   ;fuction to start the quesion again or leave 
	MOV AH,2
	MOV DL,"1"             ;enter 1 to re attempt
	INT 21H  
	MOV DL,"0"             ;enter 0 to exit
	INT 21H
	JMP EXIT1
	
	NL:                    ;new line fuction declaration
	MOV AH,2
	MOV DL, 0AH
	INT 21H   
    MOV DL, 0DH
    INT 21H
    RET 
    
    QN2:                     ;fuction printing question number 2
    LEA DX,Q2
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA2                ;printing the choices of question number 2
	MOV AH,9
	INT 21H
	RET 
	
	QN3:                     ;fuction printing question number 3
    LEA DX,Q3
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA3                ;printing the choices of question number 3
	MOV AH,9
	INT 21H
	RET
	
	QN4:                     ;fuction printing question number 4
    LEA DX,Q4
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA4                ;printing the choices of question number 4
	MOV AH,9
	INT 21H
	RET
	
	QN5:                     ;fuction printing question number 5
    LEA DX,Q5
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA5                ;printing the choices of question number 5
	MOV AH,9
	INT 21H
	RET                     
	
	QN6:                     ;fuction printing question number 6
    LEA DX,Q6
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA6                ;printing the choices of question number 6
	MOV AH,9
	INT 21H
	RET
	
	QN7:                     ;fuction printing question number 7
    LEA DX,Q7
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA7                ;printing the choices of question number 7
	MOV AH,9
	INT 21H
	RET 
	
	QN8:                     ;fuction printing question number 8
    LEA DX,Q8
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA8                ;printing the choices of question number 8
	MOV AH,9
	INT 21H
	RET  
	
	QN9:                     ;fuction printing question number 9
    LEA DX,Q9
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA9                ;printing the choices of question number 9
	MOV AH,9
	INT 21H
	RET 
	
	QN10:                     ;fuction printing question number 10
    LEA DX,Q10
	MOV AH,9
	INT 21H
	
	CALL NL                   ;new line
    
	LEA DX,QA10                ;printing the choices of question number 10
	MOV AH,9
	INT 21H
	RET  
	
	INPUT:                    ;fuction for accepting input choice from user
	CALL NL
    
	MOV AH, 1
	INT 21H
	RET
	
	
	EXIT1:                    ;fuction to exit the execution of the program
	CALL NL                   ;new line
	CALL NL                   ;new line
	
	LEA DX,MSG10              ;printing the message Press 1 to Re-attempt quiz or 0 to Exit
	MOV AH,9
	INT 21H
	
	MOV AH,1
	INT 21H
	
	CMP AL,'1'
	JE START 
	
	CALL NL                   ;new line
	CALL NL                   ;new line
	
	LEA DX,MSG11              ;displays message *thank you*
	MOV AH,9
	INT 21H
	
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP
END MAIN;the main fuction is ended here
