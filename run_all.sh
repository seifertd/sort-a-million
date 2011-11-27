#!/bin/bash

echo "Generating input file"
ruby gen.rb > million.txt

echo 'time ruby count_occurences.rb < million.txt > million_sorted.txt'
time ruby count_occurences.rb < million.txt > million_sorted.txt

echo 'time ruby chunked_reads.rb < million.txt > million_sorted_2.txt'
time ruby chunked_reads.rb < million.txt > million_sorted_2.txt

echo 'time ruby standard_ruby.rb < million.txt > million_sorted_3.txt'
time ruby standard_ruby.rb < million.txt > million_sorted_3.txt

echo 'time ruby build_strings.rb < million.txt > million_sorted_4.txt'
time ruby build_strings.rb < million.txt > million_sorted_4.txt

echo 'time ruby build_strings_2.rb < million.txt > million_sorted_5.txt'
time ruby build_strings_2.rb < million.txt > million_sorted_5.txt

echo 'time sed -n "2,$p" million.txt | sort -n > million_bash.txt'
time sed -n '2,$p' million.txt | sort -n > million_bash.txt

echo "CONFIRM"
diff million_sorted.txt million_sorted_2.txt
diff million_sorted.txt million_sorted_3.txt
diff million_sorted.txt million_sorted_4.txt
diff million_sorted.txt million_sorted_5.txt
diff million_sorted.txt million_bash.txt
