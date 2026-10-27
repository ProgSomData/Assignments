# Assignment 8

## Exercise 10.1

### (i)

Add:
for add, we take the current top 2 elements in the stack (s[sp] and s[sp-1]) and untag them.
Once we get the real values, we add them together, and cover the value with tag, and store it
in the stack's second-last index (s[sp-1]), then we decrement the sp with sp--,
so [sp-1] becomes the top element on the stack.

CSTI i:
Loads the constant i from the program (Tag(p[pc++])) onto the stack with s[sp+1], then increments the stackpointer to point to the new top of the stack.

NIL:
loads a NIL value onto the stack, then updates the sp to point to the top of the stack.
NIL represents an empty reference, that doesn't point to anything in the heap.
For the garbage collector to read 0 as a value, we use Tag(0) = 1, whereas NIL literally stores 0,
So the collector can recognize it's an empty reference.

IFZERO:
we load the top element from the stack and store it in word v.
then we use (IsInt(v) ? Untag(v) == 0 : v == 0) to check if the value is 0 or not. 
If isInt(v), we untag v first, then check == 0.
If the condition is true, we jump to pc in p (p[pc]).
If the condition is false, we continue with pc = pc+1. we jump to pc in p (p[pc]).

CONS:
we start by creating a pointer p to a object of the type word.
We use allocate to create space for the object that p references, 
then use s and sp to load the two top elements from the stack afterwards as head and tail respectively in the object, 
then load the reference p back onto the stack on s[sp-1], 
and decrement the stackpointer to point to p at the top of the stack.

CAR:
creates a word pointer to the heap object referenced by the top element of the stack.
If the pointer is null, we print an error message and return -1.
Otherwise, we replace the top element of the stack with the first value in the boject referenced by p (p[1])

SETCAR:
loads the top of the stack onto the word object v, then decrements sp.
Creates a pointer p like in CAR, then loads v onto that object as the first element (p[1] = v)


### (ii)

The header, as described in microvm.c, describes Length, Type and Color for an object stored in the heap.
in ttttttttnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnngg :
tttttttt                                                = block tag, which describes the type of the object.
nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn    = block length excluding header, which here is 54 bits, which represents 64 bit
gg                                                      = block color, which describes the heap status of the block
   gg=00=White: block is dead (after mark, before sweep)
   gg=01=Grey:  block is live, children not marked (during mark)
   gg=10=Black: block is live (after mark, before sweep)
   gg=11=Blue:  block is on the freelist or orphaned

Length(hdr): Extracts the block length from the header by shifting 2 bits to the right, masking the remaining bits.
Color(hdr): Extracts the last 2 bits of the header, which represent the block's color.
Paint(hdr, color): Changes the last 2 bits of the header to the specified color, without changing the block tag or length.


### (iii + iv)
The allocate function is used in CONS as mentioned and also in HEAPALLOC,
which allocates a new heap object with the specified tag and size n.

The garbage collector is also interacted with in allocate(), where:
    if (attempt==1)
        collect(s, sp);

If allocate() attempt fails, collect is called to free up memory.


## 10.2
markPhase() – runs through the stack and finds living objects.
mark() – marks an object and follows it's references recursively
sweepPhase() – runs through the heap and removes white-marked objects.

Output from running ex55.out:
(base) PS C:\Users\dajap\OneDrive\ITU\5. semester\Programmer som data\Assignments\AssignmentsRepo\Assignment8\MicroVM> .\microvm.exe ex55.out 4    
2 4 1 3 
3 1 4 2 

2 

Result value: #1632862818216 
Used 15 cpu milli-seconds
Number of GC: 0


## 10.3
