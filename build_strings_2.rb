GC.disable
n = STDIN.gets.to_i
a = Array.new(1e6+1) {|n| ""}
NEWLINE = "\n"

while n > 0
  i_str = STDIN.gets
  i = i_str.to_i
  a[i] << i_str
  n -= 1
end

n = 0
while n < 1_000_001
  STDOUT.write a[n]
  n += 1
end
