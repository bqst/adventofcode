class Heatmap
  def initialize(input)
    @matrix = input.map(&:strip).map { |l| l.to_s.split('').map(&:to_i) }
    @height = @matrix.size
    @width = @matrix.first.size
  end

  def neighbors_position(x, y)
    [
      x > 0 ? [x - 1, y] : nil,
      x < @height - 1 ? [x + 1, y] : nil,
      y > 0 ? [x, y - 1] : nil,
      y < @width - 1 ? [x, y + 1] : nil
    ].compact
  end

  def neighbors(x, y)
    neighbors_position(x, y).map { |n| @matrix[n[0]][n[1]] }
  end

  def low_point_positions
    positions = []
    @matrix.each_with_index.each do |row, x|
      row.each_with_index.each do |cell, y|
        positions << [x, y] if neighbors(x, y).all? { |n| n > cell }
      end
    end
    positions
  end

  def low_points
    low_point_positions.map { |x| @matrix[x[0]][x[1]] }
  end

  def risk_level
    low_points.map { |p| p + 1 }.sum
  end

  def basin_size(x, y, visited_points = [])
    return 0 if @matrix[x][y] == 9
    return 0 if visited_points.include?([x, y])

    visited_points << [x, y]
    1 + neighbors_position(x, y).sum { |row, col| basin_size(row, col, visited_points) }
  end
end

def read_input(filename)
  File.readlines(filename)
end

def part1(filename)
  input = read_input(filename)
  heatmap = Heatmap.new(input)
  heatmap.risk_level
end

def part2(filename)
  input = read_input(filename)
  heatmap = Heatmap.new(input)
  heatmap.low_point_positions.map { |x| heatmap.basin_size(x[0], x[1]) }.sort.last(3).inject(:*)
end

puts part1('input')
puts part2('input')
