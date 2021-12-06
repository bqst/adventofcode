class Aquarium
  def initialize(state)
    records = state.tally
    @cycle = (0..8).collect { |i| records[i] || 0 }
  end

  def progress(days)
    cycle = @cycle
    days.times do
      cycle = cycle.rotate
      cycle[6] += cycle[8]
    end
    cycle
  end

  def nb_fish(days)
    progress(days).sum
  end
end

def read_input(filename)
  File.read(filename).split(',').collect(&:to_i)
end

def part1(filename)
  fishes = read_input(filename)
  Aquarium.new(fishes).nb_fish(80)
end

def part2(filename)
  fishes = read_input(filename)
  Aquarium.new(fishes).nb_fish(256)
end

puts part1('input')
puts part2('input')
