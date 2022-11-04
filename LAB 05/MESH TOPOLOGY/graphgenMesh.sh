set terminal png
set output 'ResultMesh.png'
set xrange [0.0:5.0]
set xlabel "Time(in seconds)"
set autoscale
set yrange [0:100]
set ylabel "Throughput(in Kbps)"
set grid
set style data linespoints
plot "meshthrpt" using 1:2 title "Mesh Throughput"
