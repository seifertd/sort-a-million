GC.disable
a = Array.new(1e6+1, 0)

CHUNK = 1024 * 1024 * 1024
NEWLINE = "\n"
INTEGER_RE = /(\d+)($)/m

n = STDIN.readline.to_i
buf = " " * CHUNK
leftovers = nil
last_leftovers = nil
use_last = false
while n > 0
  STDIN.read_nonblock(CHUNK, buf)
  use_last = buf.end_with?(NEWLINE)
  # EDGE CASE: If buf starts with a newline, we have to treat last_leftovers as a real number
  if last_leftovers && buf.start_with?(NEWLINE)
    a[last_leftovers] += 1
    n -= 1
    last_leftovers = nil
  end
  buf.scan(INTEGER_RE) do |i_str, t|
    if last_leftovers
      i_str = "#{last_leftovers}#{i_str}"
      last_leftovers = nil
    end
    i = i_str.to_i
    leftovers = i
    a[i] += 1
    n -= 1
  end
  if !use_last
    n += 1
    a[leftovers] -= 1
    last_leftovers = leftovers
  else
    last_leftovers = nil
  end
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
