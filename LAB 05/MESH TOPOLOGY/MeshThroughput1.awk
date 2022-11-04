BEGIN {
	recvdSize = 0
	startTime = 2.0
	stopTime = 0
	sent = 0
	received=0
	dropped=0
	forwarded=0
	gotime=0
	time_interval=0.1;
}
  {
	 event = $1
	  time = $2
	  node_id = $4
	  pkt_size = $6
  }
{
  if(time>gotime) {

  print gotime, (recvdSize * received * 8.0)/1000;
  gotime+=time_interval;
  received=0;
  }
  if ((event == "+" ) && pkt_size >= 512) {
	sent++
	if(time < startTime) {
		startTime = time
		}
  }
  if (event == "-" && pkt_size >= 512) {
	dropped++
  }
  if (event == "r" && pkt_size >= 512) {
	forwarded++
  }

  if (event == "r" && pkt_size >= 512) {
	if (time > stopTime) {
		stopTime = time
	}
	received++
	hdr_size = pkt_size % 512
	pkt_size -= hdr_size
	recvdSize += pkt_size
  }
}
  END {
	printf("Average Throughput(kbps) = %.2f\t\t StartTime=%.2f\tStopTime=%.2f\n",(recvdSize/(stopTime-startTime))*(8/1000),startTime,stopTime)
	print("Sent - ",sent)
	print("Received - ",received)	
  }
