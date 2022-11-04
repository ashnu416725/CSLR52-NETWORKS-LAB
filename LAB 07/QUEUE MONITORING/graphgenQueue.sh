set terminal png
set output 'ResultQueue.png'
set xrange [0.0:1000.0]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:400]
set ylabel "Throughput(in Kbps)"
set grid
set style data linespoints
plot "queuethrpt" using 1:2 title "Queue Throughput"
