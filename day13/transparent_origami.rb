class Dot

  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

end

class Paper

  attr_accessor :dots, :width, :heigth

  def initialize(dots = [])
    @dots = dots
    @width = dots.map(&:x).max + 1
    @heigth = dots.map(&:y).max + 1
  end

  def to_s
    @heigth.times.map do |y|
      @width.times.map do |x|
        dot = @dots.find { |d| d.x == x && d.y == y }
        dot ? '#' : '.'
      end.join
    end
  end

  def fold!(direction, amount)
    case direction
    when 'y'
      fold_up!(amount)
    when 'x'
      fold_left!(amount)
    end
  end

  def fold_up!(y)
    @dots.select { |d| d.y > y }.each do |dot|
      delta = dot.y - y
      if @dots.any? { |d| d.x == dot.x && d.y == y - delta }
        @dots.delete(dot)
      else
        dot.y = y - delta
      end
    end
    @heigth = @heigth - y - 1
  end

  def fold_left!(x)
    @dots.select { |d| d.x > x }.each do |dot|
      delta = dot.x - x
      if @dots.any? { |d| d.x == x - delta && d.y == dot.y }
        @dots.delete(dot)
      else
        dot.x = x - delta
      end
    end
    @width = @width - x - 1
  end
end

def read_input(input)
  File.readlines(input, chomp: true)
end

def part1(input)
  lines = read_input(input)
  instructions = lines.select { |line| line.start_with?('fold along ') }
  lines.pop(instructions.size + 1)

  dots = lines.map do |line|
    x, y = line.split(',').map(&:to_i)
    Dot.new(x, y)
  end

  paper = Paper.new(dots)

  instructions.first.gsub!('fold along ', '')
  direction, amount = instructions.first.split('=')
  paper.fold!(direction, amount.to_i)

  paper.dots.size
end

def part2(input)
  lines = read_input(input)
  instructions = lines.select { |line| line.start_with?('fold along ') }
  lines.pop(instructions.size + 1)

  dots = lines.map do |line|
    x, y = line.split(',').map(&:to_i)
    Dot.new(x, y)
  end

  paper = Paper.new(dots)

  instructions.each do |instruction|
    instruction.gsub!('fold along ', '')
    direction, amount = instruction.split('=')
    paper.fold!(direction, amount.to_i)
  end

  paper.to_s
end

pp part1('input')
pp part2('input')
