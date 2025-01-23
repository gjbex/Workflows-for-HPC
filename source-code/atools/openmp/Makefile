CC = gcc
CFLAGS = -fopenmp -O3 -Wall -Wextra
LDFLAGS = -fopenmp

all: pi.exe

pi.exe: pi.o
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	$(RM) $(wildcard *.exe *.o)
