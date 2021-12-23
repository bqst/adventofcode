class Number
  attr_accessor :value, :left, :right, :parent

  def initialize(value, parent = nil)
    @parent = parent
    if value.is_a?(Integer)
      @value = value
    else
      @left = value[0].is_a?(Number) ? value[0] : Number.new(value[0], self)
      @right = value[1].is_a?(Number) ? value[1] : Number.new(value[1], self)
    end
  end

  def regular?
    !@value.nil?
  end

  def +(other)
    Number.new([self, other], parent).reduce
  end

  # found solution thanks to https://github.com/chrislwade/aoc-2021/blob/main/lib/day18.rb
  def reduce
    loop do
      next if explode!
      next if split!

      break
    end
    self
  end

  def explode!
    stack = [[self, 0]]

    until stack.empty?
      number, depth = *stack.pop
      next if number.nil?

      if depth >= 4 && number.value.nil? &&
        ((number.left.nil? && number.right.nil?) || (!number.left.value.nil? && !number.right.value.nil?))
        explode_left!(number)
        explode_right!(number)

        number.value = 0
        number.left = number.right = nil

        return true
      end

      stack.push([number.right, depth + 1])
      stack.push([number.left, depth + 1])
    end

    return false
  end

  def explode_left!(number)
    previous = number.left
    current  = number

    while !current.nil? && (current.left == previous || current.left.nil?)
      previous = current
      current  = current.parent
    end

    unless current.nil?
      current = current.left
      while current.value.nil?
        current = current.right.nil? ? current.left : current.right
      end
      current.value += number.left.value
    end
  end

  def explode_right!(number)
    previous = number.right
    current  = number

    while !current.nil? && (current.right == previous || current.right.nil?)
      previous = current
      current  = current.parent
    end

    unless current.nil?
      current = current.right
      while current.value.nil?
        current = current.left.nil? ? current.right : current.left
      end
      current.value += number.right.value
    end
  end

  def split!
    stack = [self]

    until stack.empty?
      number = stack.pop
      next if number.nil?

      unless number.value.nil?
        if number.value >= 10
          number.left  = Number.new((number.value.to_f / 2).floor, number)
          number.right = Number.new((number.value.to_f / 2).ceil, number)
          number.value = nil

          return true
        end
      end

      stack.push(number.right)
      stack.push(number.left)
    end

    false
  end

  def magnitude
    regular? ? @value : 3 * @left.magnitude + 2 * @right.magnitude
  end
end

def read_input(filename)
  File.readlines(filename, chomp: true)
end

def part1(input)
  lines = read_input(input)
  lines.map { |line| Number.new(eval(line)) }.reduce(:+).magnitude
end

def part2(input)
  lines = read_input(input)
  lines.permutation(2).map { |x, y| (Number.new(eval(x)) + Number.new(eval(y))).magnitude }.max
end

pp part1('input')
pp part2('input')
