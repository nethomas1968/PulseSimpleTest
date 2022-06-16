# PulseSimpleTest
Simple Test Program To Exercise PulseAudio Library On Linux.


This is a simple demonstration on how to play a wav file.
First we need to obtain a wav file (see /usr/share/sounds), and copy a wav file to the Sounds directory.
Then run make_pcm_raw_header.sh, it will convert the wav files to pcm, and then to a header file. It will then create a sound_headers.h file which can be #included in to the pulse_simple_play.c file.

Check that the pulse_simple_play.c file uses the correct name in the pa_simple_write function call.
For example, if the wav file is called something.wav then the array name is "something", and the length variable is something_len.
(Note that any dash characters in the wav file name are converted to underscores.)

Then compile it using 'make'.

Finally, run the pulse_simple_play file (no args), and the sound should come out of the speakers.

It's a synchronous use of a simple sound playing API. Might be of some use.
