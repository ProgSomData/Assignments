# Assignment 6
### 7.4

### 7.5

### 8.1

> compileToFile (fromFile "CEx/ex03.c") "CEx/ex03.out";;
val it: Machine.instr list =
  [LDARGS 1; CALL (1, "L1"); STOP; Label "L1"; INCSP 1; GETBP; CSTI 1; ADD;
   CSTI 0; STI; INCSP -1; GOTO "L3"; Label "L2"; GETBP; CSTI 1; ADD; LDI;
   PRINTI; INCSP -1; GETBP; CSTI 1; ADD; GETBP; CSTI 1; ADD; LDI; CSTI 1; ADD;
   STI; INCSP -1; INCSP 0; Label "L3"; GETBP; CSTI 1; ADD; LDI; GETBP; CSTI 0;
   ADD; LDI; LT; IFNZRO "L2"; INCSP -1; RET 0]



ex03.c
    LDARGS 1
    CALL (1, L1)
    STOP

L1:
    INCSP 1             int i
    GETBP
    CSTI 1              
    ADD
    CSTI 0
    STI
    INCSP -1            i = 0
    GOTO L3

L2:
    GETBP               
    CSTI 1
    ADD
    LDI
    PRINTI              
    INCSP -1            print i
    GETBP
    CSTI 1
    ADD
    GETBP
    CSTI 1
    ADD
    LDI
    CSTI 1
    ADD
    STI
    INCSP -1            i = i+1
    INCSP 0             

L3:
    GETBP
    CSTI 1
    ADD
    LDI
    GETBP
    CSTI 0
    ADD
    LDI
    LT
    IFNZRO "L2"         While (i < n)
    INCSP -1
    RET 0
    


> compileToFile (fromFile "CEx/ex05.c") "CEx/ex05.out";;
val it: Machine.instr list =
  [LDARGS 1; CALL (1, "L1"); STOP; Label "L1"; INCSP 1; GETBP; CSTI 1; ADD;
   GETBP; CSTI 0; ADD; LDI; STI; INCSP -1; INCSP 1; GETBP; CSTI 0; ADD; LDI;
   GETBP; CSTI 2; ADD; CALL (2, "L2"); INCSP -1; GETBP; CSTI 2; ADD; LDI;
   PRINTI; INCSP -1; INCSP -1; GETBP; CSTI 1; ADD; LDI; PRINTI; INCSP -1;
   INCSP -1; RET 0; Label "L2"; GETBP; CSTI 1; ADD; LDI; GETBP; CSTI 0; ADD;
   LDI; GETBP; CSTI 0; ADD; LDI; MUL; STI; INCSP -1; INCSP 0; RET 1]


    LDARGS 1
    CALL (1, "L1")
    STOP

L1:
    INCSP 1                 grow stack      
    GETBP                   load base ptr bp
    CSTI 1                  push constant i onto stack
    ADD                     
    GETBP
    CSTI 0
    ADD
    LDI
    STI
    INCSP -1
    INCSP 1
    GETBP
    CSTI 0
    ADD
    LDI
    GETBP
    CSTI 2
    ADD
    CALL (2, "L2")
    INCSP -1
    GETBP
    CSTI 2
    ADD
    LDI
    PRINTI
    INCSP -1
    INCSP -1
    GETBP
    CSTI 1
    ADD
    LDI
    PRINTI
    INCSP -1
    INCSP -1
    RET 0

L2:
    GETBP
    CSTI 1
    ADD
    LDI
    GETBP
    CSTI 0
    ADD
    LDI
    GETBP
    CSTI 0
    ADD
    LDI
    MUL
    STI
    INCSP -1
    INCSP 0
    RET 1
    ### 8.3
     | PreInc acc     -> cAccess acc varEnv funEnv @ [DUP;LDI;CSTI 1; ADD; STI]
    | PreDec acc     -> cAccess acc varEnv funEnv @ [DUP;LDI;CSTI 1; SUB; STI]
    
    ### 8.4
    its much slower because 1 its running 4 times as many instructions and 2 prog1 keeps the counter in the stack where ex08 keep it in memory. so it has to get the pointer value decrement it at clear the stack at each step. it also has 1 instruction incsp 0 that does nothing. 
    (ii)
    there are some jumps that lead straight to another jump like l8 goto l6. there is alot of recomputation to keep the value in memory instead of the stack. incsp is also there twice which doesnt do anything. he loops doesnt test the conditionals when the values are computed.
    
