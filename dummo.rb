#!/usr/bin/env ruby
GC.disable
count = STDIN.readline.to_i
list = []
count.times do 
  list << STDIN.readline.to_i
end
i = 0
while i < count
  j = 0
  while j < count
    if list[j] > list[i]
      list[i], list[j] = list[j], list[i]
    end
    j += 1
  end
  i += 1
end
puts list

