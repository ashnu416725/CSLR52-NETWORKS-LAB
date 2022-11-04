BEGIN {
recv=0;
gotime = 1;
time = 0;
packet_size = $8;
time_interval=1;
}
#body
{
       event = $1
       	     time = $2
             node_id = $3
             pktType = $5
	     packet_size = $6
	     
 if(time>gotime) {

  print gotime, (packet_size * recv * 8.0)/1000; #packet size * ... gives results in kbps
  gotime+= time_interval;
  recv=0;
  }

  if (( event == "r") && ( pktType == "udp" ))
  {
     recv++;
  }

} #body


END {
;
}