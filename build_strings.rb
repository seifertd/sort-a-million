GC.disable
n = STDIN.gets.to_i
a = Array.new(1e6+1) { |n| "" }

src = STDIN.read
pos=0
while n > 0
 cur = pos
 while src[pos] != "\n"
   pos +=1
 end
 l = src[cur..pos]
 a[l.to_i] << l
 pos +=1
 n -=1
end

STDOUT.print a.join

