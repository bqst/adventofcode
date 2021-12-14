class Grid
  attr_accessor :flashes, :width, :height

  def initialize(input)
    @grid   = input.map(&:strip).map { |l| l.to_s.split('').map(&:to_i) }
    @height = @grid.size
    @width  = @grid.first.size

    @energized = []
    @flashed   = []
    @flashes   = 0
  end

  def step!
    @energized = []
    @flashed   = []

    @grid.each_with_index do |row, x|
      row.each_with_index do |_, y|
        pulse(x, y)
      end
    end

    flash(*@energized.pop) while @energized.any?
    reset(*@flashed.pop) while @flashed.any?
  end

  def pulse(x, y)
    @grid[x][y] += 1
    energize(x, y) if @grid[x][y] > 9
  end

  def energize(x, y)
    return if @energized.include?([x, y])

    @energized << [x, y]
  end

  def flash(x, y)
    return if @flashed.include?([x, y])

    @flashed << [x, y]
    @flashes += 1
    neighbors_position(x, y).each { |p| pulse(p[0], p[1]) }
  end

  def neighbors_position(x, y)
    [
      [x - 1, y - 1],
      [x - 1, y],
      [x - 1, y + 1],
      [x, y - 1],
      [x, y + 1],
      [x + 1, y - 1],
      [x + 1, y],
      [x + 1, y + 1]
    ].reject { |p| p[0].negative? || p[1].negative? || p[0] >= @width || p[1] >= @height }
  end

  def reset(x, y)
    @grid[x][y] = 0
  end
end

def read_input(filename)
  File.readlines(filename, chomp: true)
end

def part1(input)
  input = read_input(input)
  grid = Grid.new(input)
  100.times { grid.step! }
  grid.flashes
end

def part2(input)
  input = read_input(input)
  grid = Grid.new(input)
  1.step do |i|
    grid.flashes = 0
    grid.step!
    return i if grid.flashes.eql?(grid.height * grid.width)
  end
end

puts part1('input')
puts part2('input')
