#para que no se me haga muy weba compilar jajaja
MAIN=Remainder
INTERFACES=Communication
PROTOCOLS=BindC KerC
BIN=Cli Kernel

$(MAIN:%=Remainder/%.class):Remainder $(PROTOCOLS:%=Remainder/protocols/%.class) $(INTERFACES:%=Remainder/interfaces/%.class) $(BIN:%=Remainder/bin/%.class) $(MAIN:%=%.java)
	javac $(MAIN).java -d Remainder/

$(INTERFACES:%=Remainder/interfaces/%.class): $(INTERFACES:%=interfaces/%.java) interfaces
	javac $< -d Remainder/

$(PROTOCOLS:%=Remainder/protocols/%.class): $(PROTOCOLS:%=protocols/%.java) protocols
	javac $< -d Remainder/

$(BIN:%=Remainder/bin/%.class): $(BIN:%=bin/%.java) bin
	javac $< -d Remainder/

Remainder:
	@mkdir -p Remainder

bin:
	@mkdir -p Remainder/bin

interfaces:
	@mkdir -p Remainder/interfaces

protocols:
	@mkdir -p Remainder/protocols

.PHONY: clean
clean:
	rm -r -f Remainder
