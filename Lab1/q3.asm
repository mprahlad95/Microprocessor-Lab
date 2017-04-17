DATA SEGMENT                             
        NUM1 DW 01234H ;DW stands for "Define Word"
        NUM2 DB 12H    ;DB stands for "Define byte"
        SUM DB ?       ; ? reserves memory to be used later
                     
DATA ENDS                               

CODE SEGMENT                            
ASSUME CS:CODE, DS:DATA                 
START:                                  
        MOV AX,DATA    ;This won't allow assembler to take
        MOV DS,AX      ;any random data segment,  and will make sure
                       ;that it uses the data segment mentioned above.
                       ;Here, 'DATA' is moved to AX and then AX is moved
                       ;to DS, which is in fact the data segment
        MOV AH,NUM1    ;Then to AH, we move the stored value in NUM1                 
        ADD AH,NUM2    ;To AH, we add NUM2
                       ;We get a warning here while adding a word with a byte
        MOV SUM,AH     ;MOV the value in AH to the reserved location

        

        INT 21H                          
CODE ENDS                               
END START                               

