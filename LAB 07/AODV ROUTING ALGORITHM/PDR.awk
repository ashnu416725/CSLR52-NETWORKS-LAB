BEGIN {
	sends=0;
	recvs=0;
	routing_packets=0;
	droppedPackets=0;
	highest_packet_id =0;
	sum=0;
	time_interval=0.1;
	recvnum=0;
	gotime=1;
	}
  {
  time = $2;
  packet_id = $6;
  event =$1;
  if(time>gotime) {
	print gotime,(sends-recvs)/sends;
	gotime+=time_interval;
  }
  if (( $1 == "s") && ( $7 == "cbr" ) && ( $4=="AGT")) { sends++; }
  if (( $1 == "r") && ( $7 == "cbr" ) && ( $4=="AGT")) { recvs++; }
  if ( start_time[packet_id] == 0 ) start_time[packet_id] = time;
  if (( $1 == "r") && ( $7 == "cbr" ) && ( $4=="AGT")) { end_time[packet_id] - time; }
	else { end_time[packet_id]=-1;
  if (( $1 == "s" || $1 == "f" || $1 == "r") $4 == "RDR" && ( $7 == "AODV" || $7 == "AOMDV"))  routing_packets++;
  if (event == "D" ) droppedPackets++;
  }
}
  END {
  for ( i in end_time )
  {
  start = start_time[i];
  end = end_time[i];
  packet_duration = end - start;
  if ( packet_duration > 0 )
  {	sum += packet_duration;
	recvnum++;
  }
  }
	delay=sum/recvnum;
	NRL = routing_packets/recvs;
	PDF = (recvs/sends)*100;
	printf("Sent Packets = %.2f\n ",sends);
	printf("Received Packets = %.2f\n",recvs);
	printf("Routing Packets = %.2f\n",routing_packets++);
	printf("Packet Delivery Function = %.2f\n",PDF);
	printf("Normalized Routing Load = %.2f\n",NRL);
	printf("Average end to end delay(ms) = %.2f\n",delay*1000);
  }
