set terminal png
set output 'ResultStar.png'
set xrange [0.0:5.0]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:10]
set ylabel "Throughput(in Kbps)"
set grid
set style data linespoints
plot "starthrpt" using 1:2 title "Star Throughput"
