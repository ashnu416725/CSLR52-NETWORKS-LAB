set terminal png
set output 'Result.png'
set xrange [0.0:150.0]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:1500]
set ylabel "Throughput(in Kbps)"
set grid
set style data linespoints
plot "AOthrpt" using 1:2 title "AODV Throughput"
