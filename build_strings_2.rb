GC.disable
n = STDIN.readline.to_i
a = Array.new(1e6+1) {|n| ""}

while n > 0
  i_str = STDIN.readline
  i = i_str.to_i
  a[i] << i_str
  n -= 1
end

n = 0
while n < 1_000_001
  STDOUT.write a[n]
  n += 1
end
