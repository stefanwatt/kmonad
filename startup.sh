#!usr/bin/bash
if [[ -z "${KMONAD_KBD}" ]]; then
  echo "Could not find your config-file. Environment variable KMONAD_KBD must be set."
  exit 69
fi 

foo=`mktemp`
exec 0<$foo
#need to pipe nonsense to stdin because evtest awaits user input 
#but i'm only interested in the immediate output
#so i just want it to stop executing 
keebline='not found'

while read line; do
  if [[ $line = *K400* ]]
then
    keebline=$line
fi

done <<< `evtest 2>&1`

eventId=`echo $keebline | gawk '{ match($0, /event([0-9]+)/, arr); if(arr[1] != "") print arr[1]}'`

`sed -i "s/event[0-9]*/event$eventId/" $KMONAD_KBD` 
`kmonad $KMONAD_KBD`