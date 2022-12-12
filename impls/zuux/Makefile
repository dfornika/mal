
STEPS = step0_repl step1_read_print

all: $(STEPS)

dist: mal


%: src/%.zig
	zig build -Drelease-fast=true
	ln -sf zig-out/bin/$* .

.PHONY: clean

clean:
	rm -f $(STEPS)
