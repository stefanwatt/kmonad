#My kmonad config

My wireless keyboard was not being listed under /dev/input/by-id/*.kbd .
I was however able to find it via evtest as suggested in the FAQ.
Since the event number does not persist through sessions I created a script to automate reading it from
the evtest output and altering my config accordingly.