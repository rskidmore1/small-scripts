#!/usr/bin/env ruby

def fun(*numbers)
  numbers.inject(0) { |sum, number| sum + number }
end

puts fun(1)
puts fun(1, 2)
puts fun(1, 2, 3)
puts fun(1, 2, 3, 4)
