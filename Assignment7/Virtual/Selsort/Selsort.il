//Exercise 9.1(i)

//These 4 local variables are mentioned to begin with:
//V_0 = i     — outer-loop index / position to fill next
//V_1 = least — index of smallest element found so far
//V_2 = tmp   — temporary value used when swapping elements
//V_3 = j     — inner-loop index used to scan for the minimum

//ld* loads a value onto the evaluation stack; st* stores/pops a value.
//Branches such as blt.s and bge.s consume the compared stack values.
//The IL prefixes are instruction offsets and branch destinations.

  .method public hidebysig static default void SelectionSort(int32[] arr) cil managed
  {
    // Method begins at Relative Virtual Address (RVA) 0x20D0
    // Code size 57 (0x39)
    .maxstack 4
    // Local variables: V_0 = i, V_1 = least, V_2 = tmp, V_3 = j.
    .locals init(int32 V_0, int32 V_1, int32 V_2, int32 V_3)

    // Initialize the outer-loop index i.
    IL_0000: ldc.i4.0                                    // Push integer constant 0 (initial value for i).
    IL_0001: stloc.0                                     // Store 0 in local V_0 (i = 0).
    IL_0002: br.s     IL_0032                            // Jump to outer loop condition before its first iteration.

    // Outer-loop body: choose the smallest element in arr[i..end].
    IL_0004: ldloc.0                                     // Load i.
    IL_0005: stloc.1                                     // Store i as least (least = i).
    IL_0006: ldloc.0                                     // Load i.
    IL_0007: ldc.i4.1                                    // Push constant 1.
    IL_0008: add                                         // Compute i + 1.
    IL_0009: stloc.3                                     // Store result in j (j = i + 1).
    IL_000a: br.s     IL_001a                            // Jump to inner loop condition before its first iteration.

    // Inner-loop body: compare arr[j] with the smallest found so far.
    IL_000c: ldarg.0                                     // Load array reference arr.
    IL_000d: ldloc.3                                     // Load j as the array index.
    IL_000e: ldelem.i4                                   // Load arr[j] onto the stack.
    IL_000f: ldarg.0                                     // Load array reference arr.
    IL_0010: ldloc.1                                     // Load least as the array index.
    IL_0011: ldelem.i4                                   // Load arr[least] onto the stack.
    IL_0012: bge.s     IL_0016                           // If arr[j] >= arr[least], skip updating least.
    IL_0014: ldloc.3                                     // Load j because arr[j] < arr[least].
    IL_0015: stloc.1                                     // Update least = j.

    // Continue inner loop with next j.
    IL_0016: ldloc.3                                     // Load j.
    IL_0017: ldc.i4.1                                    // Push constant 1.
    IL_0018: add                                         // Compute j + 1.
    IL_0019: stloc.3                                     // Store incremented j (j++).

    // Inner-loop condition.
    IL_001a: ldloc.3                                     // Load j for inner loop condition.
    IL_001b: ldarg.0                                     // Load array reference arr.
    IL_001c: ldlen                                       // Get array length (arr.Length).
    IL_001d: conv.i4                                     // Convert length to 32-bit integer.
    IL_001e: blt.s     IL_000c                           // Repeat inner loop while j < arr.Length.

    // Swap arr[i] and arr[least] using tmp.
    IL_0020: ldarg.0                                     // Load arr for reading arr[i].
    IL_0021: ldloc.0                                     // Load i as the array index.
    IL_0022: ldelem.i4                                   // Read arr[i].
    IL_0023: stloc.2                                     // Save original arr[i] in tmp.
    IL_0024: ldarg.0                                     // Load target array for assignment arr[i] = ...
    IL_0025: ldloc.0                                     // Load target index i.
    IL_0026: ldarg.0                                     // Load source array arr.
    IL_0027: ldloc.1                                     // Load source index least.
    IL_0028: ldelem.i4                                   // Read arr[least].
    IL_0029: stelem.i4                                   // Write arr[least] into arr[i].
    IL_002a: ldarg.0                                     // Load target array for assignment arr[least] = ...
    IL_002b: ldloc.1                                     // Load target index least.
    IL_002c: ldloc.2                                     // Load saved value tmp.
    IL_002d: stelem.i4                                   // Write tmp into arr[least]; swap is complete.

    // Continue outer loop with next i.
    IL_002e: ldloc.0                                     // Load i.
    IL_002f: ldc.i4.1                                    // Push constant 1.
    IL_0030: add                                         // Compute i + 1.
    IL_0031: stloc.0                                     // Store incremented i (i++).

    // Outer-loop condition.
    IL_0032: ldloc.0                                     // Load i for outer loop condition.
    IL_0033: ldarg.0                                     // Load array reference arr.
    IL_0034: ldlen                                       // Get array length (arr.Length).
    IL_0035: conv.i4                                     // Convert length to 32-bit integer.
    IL_0036: blt.s     IL_0004                           // Repeat outer loop while i < arr.Length.
    IL_0038: ret                                         // Return from SelectionSort (void).
  } // End of method System.Void Selsort::SelectionSort(System.Int32[])
