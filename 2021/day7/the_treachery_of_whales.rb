class Crab
  def initialize(position)
    @position = position
  end

  def fuel_cost(new_position, updated = false)
    cost = (@position - new_position).abs
    updated ? cost * (cost + 1) / 2 : cost
  end
end

def total_fuel_cost(crabs, position, updated = false)
  crabs.collect { |crab| crab.fuel_cost(position, updated) }.sum
end

def read_input(filename)
  File.read(filename).split(',').collect(&:to_i)
end

def part1(filename)
  positions = read_input(filename)
  max_position = positions.max
  crabs = positions.collect { |position| Crab.new(position) }
  0.upto(max_position).collect { |position| total_fuel_cost(crabs, position) }.min
end

def part2(filename)
  positions = read_input(filename)
  max_position = positions.max
  crabs = positions.collect { |position| Crab.new(position) }
  0.upto(max_position).collect { |position| total_fuel_cost(crabs, position, true) }.min
end

puts part1('input')
puts part2('input')
