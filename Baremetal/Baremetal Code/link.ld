ENTRY(_reset);  
MEMORY {  
  flash(rx)  : ORIGIN = 0x08000000, LENGTH = 512k  
  sram(rwx) : ORIGIN = 0x20000000, LENGTH = 128k
}
_estack     = ORIGIN(sram) + LENGTH(sram);   

SECTIONS {
  .vectors  : { KEEP(*(.vectors)) }   > flash  
  .text     : { *(.text*) }           > flash  
  .rodata   : { *(.rodata*) }         > flash    

  .data : {   
    _sdata = .;  
    *(.first_data) 
    *(.data) 
    _edata = .; 
  } > sram AT > flash 
  _sidata = LOADADDR(.data);  

  .bss : {  
    _sbss = .; 
    *(.bss)
    _ebss = .; 
  } > sram

  . = ALIGN(8);  
  _end = .;  
}
