DESTDIR         =
PREFIX          =/usr/local
CC              =gcc
CFLAGS          =-Wall -g
PROG_PATHSEARCH =tools/pathsearch$(EXE)
HEADERS         =sys/forkexec.h sys/pathsearch.h
PROGRAMS        =$(PROG_PATHSEARCH)

all: $(PROG_PATHSEARCH)
$(PROG_PATHSEARCH): tools/pathsearch.c sys/pathsearch.h
	$(CC) -o $@ tools/pathsearch.c $(CFLAGS)
install: $(HEADERS) $(PROGRAMS)
	mkdir -p $(DESTDIR)$(PREFIX)/include/sys
	cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/sys
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin

## -- manpages --
MAN_3=./doc/pathsearch.3 
install: install-man3
install-man3: $(MAN_3)
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp $(MAN_3) $(DESTDIR)$(PREFIX)/share/man/man3
## -- manpages --
## -- license --
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-exec
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-exec
## -- license --
