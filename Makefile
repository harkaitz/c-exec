DESTDIR         =
PREFIX          =/usr/local
CC              =gcc
CFLAGS          =-Wall -g
HEADERS         =sys/forkexec.h sys/pathsearch.h
PROGRAMS        =tools/pathsearch$(EXE)
CFLAGS_ALL      =$(CFLAGS) $(CPPFLAGS)

## ---------------------
all: $(PROGRAMS)
install: $(HEADERS) $(PROGRAMS)
	mkdir -p $(DESTDIR)$(PREFIX)/include/sys
	cp $(HEADERS) $(DESTDIR)$(PREFIX)/include/sys
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(PROGRAMS) $(DESTDIR)$(PREFIX)/bin
clean:

## --------------
tools/pathsearch$(EXE): tools/pathsearch.c sys/pathsearch.h
	$(CC) -o $@ tools/pathsearch.c $(CFLAGS_ALL) $(LIBS)

## -- manpages --
ifneq ($(PREFIX),)
MAN_3=./doc/pathsearch.3 
install: install-man3
install-man3: $(MAN_3)
	mkdir -p $(DESTDIR)$(PREFIX)/share/man/man3
	cp $(MAN_3) $(DESTDIR)$(PREFIX)/share/man/man3
endif
## -- manpages --
## -- license --
ifneq ($(PREFIX),)
install: install-license
install-license: LICENSE
	mkdir -p $(DESTDIR)$(PREFIX)/share/doc/c-exec
	cp LICENSE $(DESTDIR)$(PREFIX)/share/doc/c-exec
endif
## -- license --
