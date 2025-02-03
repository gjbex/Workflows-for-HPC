CC = gcc
CFLAGS = -fopenmp -std=gnu99 -O3 -g -Wall -Wextra -Wpedantic

all: pi.exe

%.exe: %.o
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) $(wildcard *.exe) $(wildcard *.o)
	$(RM) core $(wildcard core.*)
