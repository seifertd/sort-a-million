GC.disable
n = STDIN.readline.to_i
a = Array.new(1e6+1, 0)

while n > 0
  i = STDIN.readline.to_i
  a[i] += 1
  n -= 1
end

n = 0
while n < 1_000_001
  times = a[n]
  n_str = n.to_s
  while times > 0
    STDOUT.puts n_str
    times -= 1
  end
  n += 1
end
