set terminal png
set output 'ResultBus.png'
set xrange [0.0:5.0]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:150]
set ylabel "Throughput(in Kbps)"
set grid
set style data linespoints
plot "busthrpt" using 1:2 title "Bus Throughput"
