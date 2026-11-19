.PHONY: all run clean

all: build/asmc

run: all
	./build/asmc

build/asmc: build/main.o
	ld -o $@ $<

build/main.o: src/main.asm
	mkdir -p build
	nasm -f elf64 -g -F dwarf -o $@ $<

clean:
	rm -rf build