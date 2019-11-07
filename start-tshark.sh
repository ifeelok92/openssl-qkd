#! /bin/bash
rm -f tshark.out
echo "tshark started on $(date +'%Y-%m-%dT%H:%M:%S.%s')" >tshark.out
tshark \
    -i lo0 \
    -w tshark.tcap \
    -V \
    -d tcp.port==44330,tls \
    "tcp port 44330" \
    >>tshark.out 2>&1 & \
    echo $! >tshark.pid
echo "Started tshark in background (PID `cat tshark.pid`)"