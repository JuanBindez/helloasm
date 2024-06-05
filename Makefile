AS=nasm
ASFLAGS=-f elf64
LD=ld
LDFLAGS=

EXECUTABLE=hello

ASM_FILES=$(wildcard *.asm)
OBJ_FILES=$(ASM_FILES:.asm=.o)

all: $(EXECUTABLE)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

$(EXECUTABLE): $(OBJ_FILES)
	$(LD) $(LDFLAGS) $^ -o $@

clean:
	rm -f $(OBJ_FILES) $(EXECUTABLE)
