#
# Makefile
#


all: pulse_simple_play

%.o: %.c sound_headers.h
	gcc -O2 -Wall -c $<
	
pulse_simple_play: pulse_simple_play.o
	gcc pulse_simple_play.o -o pulse_simple_play -lpulse-simple
	
	
.PHONY: clean
clean:
	rm *.o pulse_simple_play
