DELIMITER = ' | '.freeze

class Entry
  def initialize(line)
    signals            = line.split(DELIMITER)
    @signal_patterns   = signals[0].split(' ').map { |c| c.chars.sort.join }
    @signal_digits     = signals[1].split(' ').map { |c| c.chars.sort.join }
  end

  def matching_chars(a, b)
    (a.chars & b.chars)
  end

  def matching_chars_size(a, b)
    matching_chars(a, b).size
  end

  def patterns
    one   = @signal_patterns.find { |signal| signal.length.eql?(2) }
    four  = @signal_patterns.find { |signal| signal.length.eql?(4) }
    seven = @signal_patterns.find { |signal| signal.length.eql?(3) }
    eight = @signal_patterns.find { |signal| signal.length.eql?(7) }
    two   = @signal_patterns.find { |signal| signal.length.eql?(5) && matching_chars_size(signal, four).eql?(2) }
    three = @signal_patterns.find { |signal| signal.length.eql?(5) && matching_chars_size(signal, one).eql?(2) }
    five  = @signal_patterns.find { |signal| signal.length.eql?(5) && matching_chars_size(signal, four).eql?(3) && matching_chars_size(signal, one).eql?(1) }
    six   = @signal_patterns.find { |signal| signal.length.eql?(6) && matching_chars_size(signal, one).eql?(1) }
    nine  = @signal_patterns.find { |signal| signal.length.eql?(6) && matching_chars_size(signal, four).eql?(4) }
    zero  = @signal_patterns.find { |signal| signal.length.eql?(6) && matching_chars_size(signal, four).eql?(3) && matching_chars_size(signal, one).eql?(2) }

    [zero, one, two, three, four, five, six, seven, eight, nine]
  end

  def digits
    @signal_digits.map { |signal_digit| patterns.index(signal_digit.chars.sort.join) }
  end

  def output
    digits.join.to_i
  end
end

def read_input(filename)
  File.readlines(filename).map(&:strip)
end

def part1(filename)
  entries = read_input(filename)
  digits = entries.map { |entry| entry.split(DELIMITER)[1] }.flatten.join(' ').split(' ')
  digits.count { |digit| [2, 3, 4, 7].include?(digit.length) }
end

def part2(filename)
  lines = read_input(filename)
  entries = lines.map { |line| Entry.new(line) }
  entries.map(&:output).sum
end

puts part1('input')
puts part2('input')
