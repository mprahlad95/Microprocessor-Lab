DATA SEGMENT
        NUM1 DD 11223344H ;This immediately defines a Double Word.
                          ;And it will be saved in form [03][02][01][00]

        NUM2 DD 99887766H ;[07][06][05][04]

        SUM DD ?          ;Reserving a double word called 'SUM' at [11][10][09][08]
        CARRY DB ?        ;Reserving a carry byte
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV SI, 00H       ;Use SI to point at 00 -- Starting address of NUM1
        MOV DI, 04H       ;Use DI to point at 04 -- Starting address of NUM2

        MOV AX, [SI]      ;Now that SI and DI point at the numbers, we move
        ADD AX, [DI]      ;the NUM1 pointed by SI to AX and add NUM2 pointed
                          ;by NUM2 to AX. Note that AX stores only one word at
                          ;a time. In this case, 3344+7766 occurs

        MOV BX, 08H       ;To BX, we move the starting address of SUM
        MOV [BX], AX      ;BX now points to SUM. To save the value of AX in
                          ;SUM, we use [BX]

        INC SI  ;To go to the next word in the same number, we increment the
        INC SI  ;pointers SI, DI and BX twice. 
        INC DI  ;In this case, so as to add 1122 and 9988
        INC DI
        INC BX
        INC BX

        MOV AX, [SI]    ;Moves 1122 to AX
        ADC AX, [DI]    ;Adds 9988 to AX with carry
        MOV [BX], AX    ;Moves the second word to SUM using BX as pointer
        CODE ENDS
END START
