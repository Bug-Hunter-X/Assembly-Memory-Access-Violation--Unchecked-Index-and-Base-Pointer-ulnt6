# Assembly Memory Access Violation Bug

This repository demonstrates a potential memory access violation in assembly code due to unchecked index register and base pointer values.  The bug occurs when accessing memory using an addressing mode that allows for out-of-bounds access, potentially leading to segmentation faults or other unexpected behavior.

## Bug Description

The assembly code attempts to access memory using the following instruction:

`mov eax, [ebx+esi*4+0x10]`

The issue lies in the lack of validation for the `ebx` and `esi` registers, causing potential memory access issues if the calculated address is outside the allocated memory boundaries.

## Solution

The solution involves adding bounds checks before accessing memory.  This ensures that the calculated address is within the valid memory range, preventing potential crashes.