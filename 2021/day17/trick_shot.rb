class Probe
  attr_accessor :range_x, :range_y, :hits

  def initialize(range_x = 0, range_y = 0)
    @range_x = range_x
    @range_y = range_y
  end

  def project!
    @hits = []
    1.upto(300) do |x_velocity|
      -300.upto(300) do |y_velocity|
        max_y = simulate(x_velocity, y_velocity)
        @hits.push(max_y) unless max_y.nil?
      end
    end
  end

  def simulate(x_velocity, y_velocity)
    x     = 0
    y     = 0
    max_y = -1

    until x > @range_x.last || y < @range_y.first
      x += x_velocity
      y += y_velocity

      x_velocity -= (x_velocity.positive? ? 1 : -1) unless x_velocity.zero?
      y_velocity -= 1

      max_y = [max_y, y].max
      return max_y if hit?(x, y)
    end

    nil
  end

  def hit?(x, y)
    @range_x.include?(x) && @range_y.include?(y)
  end
end

def read_input(filename)
  File.readlines(filename, chomp: true)
end

def part1(input)
  lines = read_input(input)
  pattern = /target area: x=(?<min_x>-?\d+)\.\.(?<max_x>-?\d+), y=(?<min_y>-?\d+)..(?<max_y>-?\d+)/
  data = pattern.match(lines.first)
  p = Probe.new(data[:min_x].to_i..data[:max_x].to_i, data[:min_y].to_i..data[:max_y].to_i)
  p.project!
  p.hits.max
end

def part2(input)
  lines = read_input(input)
  pattern = /target area: x=(?<min_x>-?\d+)\.\.(?<max_x>-?\d+), y=(?<min_y>-?\d+)..(?<max_y>-?\d+)/
  data = pattern.match(lines.first)
  p = Probe.new(data[:min_x].to_i..data[:max_x].to_i, data[:min_y].to_i..data[:max_y].to_i)
  p.project!
  p.hits.count
end

pp part1('input')
pp part2('input')
