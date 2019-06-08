#para que no se me haga muy weba compilar jajaja
MAIN=Remainder
INTERFACES=Communication
PROTOCOLS=BindC KerC
BIN=Cli Kernel

exe: $(MAIN:%=Remainder/%.class)
	java -cp ./Remainder Remainder

$(MAIN:%=Remainder/%.class):Remainder interfaces protocols bin $(PROTOCOLS:%=Remainder/protocols/%.class) $(INTERFACES:%=Remainder/interfaces/%.class) $(BIN:%=Remainder/bin/%.class) $(MAIN:%=%.java)
	javac $(MAIN).java -d Remainder/

.SECONDEXPANSION:
$(INTERFACES:%=Remainder/interfaces/%.class):%.class:interfaces/$$(basename $$(notdir %)).java
	javac $< -d Remainder/

$(PROTOCOLS:%=Remainder/protocols/%.class):%.class:protocols/$$(basename $$(notdir %)).java
	javac $< -d Remainder/

$(BIN:%=Remainder/bin/%.class):%.class:bin/$$(basename $$(notdir %)).java
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
