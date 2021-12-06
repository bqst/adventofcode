class Line
  def initialize(x1, y1, x2, y2)
    @x1, @y1, @x2, @y2 = x1, y1, x2, y2
  end

  def horizontal?
    @y1.eql?(@y2)
  end

  def vertical?
    @x1.eql?(@x2)
  end

  def cover_points(with_diagonal = false)
    points = []
    if horizontal?
      x_min, x_max = [@x1, @x2].minmax
      points = (x_min..x_max).collect { |x| [x, @y1] }
    elsif vertical?
      y_min, y_max = [@y1, @y2].minmax
      points = (y_min..y_max).collect { |y| [@x1, y] }
    elsif with_diagonal
      x_range = @x1 < @x2 ? @x1.upto(@x2) : @x1.downto(@x2)
      y_range = @y1 < @y2 ? @y1.upto(@y2) : @y1.downto(@y2)
      points = x_range.zip(y_range)
    end
    points
  end
end

def read_input(filename)
  lines = File.readlines(filename)
  lines.collect do |l|
    match = l.match(/(?<x1>\d+),(?<y1>\d+) -> (?<x2>\d+),(?<y2>\d+)/)
    Line.new match[:x1].to_i, match[:y1].to_i, match[:x2].to_i, match[:y2].to_i
  end
end

def diagram(lines, with_diagonal = false)
  points = []

  lines.each do |line|
    line.cover_points(with_diagonal).each do |x, y|
      points[y]    ||= []
      points[y][x] ||= 0
      points[y][x] = points[y][x] + 1
    end
  end

  points
end

def part1(filename)
  lines = read_input(filename)
  diagram(lines).flatten.compact.select { |x| x > 1 }.count
end

def part2(filename)
  lines = read_input(filename)
  diagram(lines, true).flatten.compact.select { |x| x > 1 }.count
end

puts part1('input')
puts part2('input')
