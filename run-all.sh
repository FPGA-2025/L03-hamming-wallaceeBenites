for a in test/teste?.txt; do
    num=$(echo $a | grep -o '[0-9]')
    ./run.sh $num
done
