# x86 Bootloader

The project is implemented in three incremental parts

- [x] Print 'Hello World!' with 16-bit mode
- [x] Print 'Hello World!' with 32-bit protected mode 
- [x] Compile and load a C++ function into memory and later call it.

## What is NASM?
The Netwide Assembler, NASM, is an 80x86 and x86-64 assembler designed for portability and modularity. It supports a range of object file formats, including Linux and *BSD a.out, ELF, COFF, Mach-O, 16-bit and 32-bit OBJ (OMF) format, Win32 and Win64. It will also output plain binary files, Intel hex and Motorola S-Record formats. Its syntax is designed to be simple and easy to understand, similar to the syntax in the Intel Software Developer Manual with minimal complexity. It supports all currently known x86 architectural extensions, and has strong support for macros.

## What is QEMU?
QEMU is a generic and open source machine emulator and virtualizer.

## Instructions to run 1st step:

1. Compile the assembly code into binary using nasm: nasm -f bin boot_v*.asm -o boot_v*.bin

2. Run **hexdump boot_v*.bin** to verify the padded zeros and the last 2 bytes.

3. Boot QEMU off a floppy disk: qemu-system-x86_64 -fda boot_v*.bin

Hello World! can be seen printed on the terminal.

For boot_v4.asm that loads a C++ program, the bootloader and c++ binary needs to be linked first to make kernel.bin. The linker script (linker.ld) loads the c++ binary right after the 1024 MB of bootloader section.

Acknowledgements:
[Alex Parker](http://3zanders.co.uk/2017/10/13/writing-a-bootloader/)
