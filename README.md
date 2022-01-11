# Kmonad
## Fixing some issues 

My wireless keyboard (Logitech K400) was not being listed under ```/dev/input/by-id/*.kbd```

As suggested in the [FAQ](https://github.com/kmonad/kmonad/blob/master/doc/faq.md) you can however still find the device file with ```evtest```. 

Since the name of the corresponding device file may change inbetween sessions, ```startup.sh``` is a little script you can put in your autostart to update your ```*.kbd```-file accordingly on startup.

An environment variable containing the path to your config file must be set. 

```export $KMONAD_KBD=/path/to/your/config/*.kbd```

## My config file
```logitech-k400.kbd``` is a config for workman-layout with arrow keys, special chars and numpad on separate layers.