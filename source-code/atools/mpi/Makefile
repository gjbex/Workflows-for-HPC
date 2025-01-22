MPICC ?= mpicc
CFLAGS ?= -O3 -g -Wall -Wextra
CPPFLAGS ?=
LDFLAGS ?=
LIBS = -lm

all: pi.exe

pi.exe: pi.c
	$(MPICC) $(CFLAGS) $(CPPFLAGS) -Wno-unknown-pragmas \
	         -o $@ $^ $(LDFLAGS) $(LIBS)

clean:
	$(RM) $(wildcard *.exe)
