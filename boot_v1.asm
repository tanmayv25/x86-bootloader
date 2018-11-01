;
;    File: boot_v1.asm
;    Author: Tanmay Verma
;    Date  : 12/01/2015
;    Writing a simple bootloader that prints 'Hello World on the screen'. 
;

bits 16 ; The CPU powers up with 16 bit mode only, which means that there are only 16 bit registers available.
org 0x7c00 ; jump to 0x7c00 to output data.

boot:
    mov si,hello ; load the memory address labelled by hello to si
    mov ah,0x0e ; 0x0e means writing character in TTY mode. This will allow us to view data on terminal

.loop:
    lodsb ; loads byte at address ds:si into a1
    or al,al ; sets 'zero' conditional flag if al is zero. This will happen at the end of the string.
    jz halt ; if the flag is zero then jump to halt
    int 0x10 ; runs BIOS interrupt 0x10 which corresponds to the Video Services.
    jmp .loop

halt:
    cli ; clears the interrupt flag
    hlt ; halt execution

hello: db "Hello world!",0

times 510 - ($-$$) db 0 ; The remaining bytes in the bootloader are set to 0. $ evaluates to the assembly position at the beginning of the line containing the expression; so you can code an infinite loop using JMP $. $$ evaluates to the beginning of the current section; so you can tell how far into the section you are by using ($−$$).

dw 0xaa55 ; BIOS expects the last double word (32Bytes) to be this value otherwise it will not boot.

  
