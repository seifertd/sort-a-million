GC.disable
$stdin.gets 
puts $stdin.readlines.map(&:to_i).sort 
