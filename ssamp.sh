#!/bin/bash
 
server_start() {
screen /home/container/samp.sh & # put in full path and name of startup script
} 
 
server_stop() {
killall startgtaserver.sh # your startup script name
killall samp03svr # need to put in path to killall if its not in $PATH
} 
 
server_restart() {
server_stop
sleep 1
server_start
}
case "$1" in
'start')
server_start
;;
'stop')
server_stop
;;
'restart')
server_restart
;;
*)
echo "use $0 start|stop|restart"
esac
