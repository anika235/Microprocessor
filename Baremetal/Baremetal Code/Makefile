CFLAGS  ?= -mcpu=cortex-m4 -mthumb 
LDFLAGS ?= -T link.ld -nostdlib -Wl,-Map=$@.map  
SOURCES = main.c startup.c 

build: firmware.bin 

firmware.elf: $(SOURCES) 
	arm-none-eabi-gcc $(SOURCES) $(CFLAGS) $(LDFLAGS) -o $@

firmware.bin: firmware.elf 
	arm-none-eabi-objcopy -O binary $< $@ 

flash: firmware.bin 
	st-flash --reset write $< 0x8000000

