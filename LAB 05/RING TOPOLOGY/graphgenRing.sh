set terminal png
set output 'ResultRing.png'
set xrange [0.0:2.0]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:80]
set ylabel "Throughput(in Kbps)"
set grid
set style data linespoints
plot "ringthrpt" using 1:2 title "Ring Throughput"
