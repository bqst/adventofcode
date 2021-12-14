PAIRS = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>'
}.freeze

POINTS_1 = {
  ')' => 3,
  ']' => 57,
  '}' => 1_197,
  '>' => 25_137
}.freeze

POINTS_2 = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4
}.freeze

def read_input(filename)
  File.readlines(filename, chomp: true).collect(&:chars)
end

def illegal_character(line)
  opened = []
  line.each do |char|
    if opened.any? && char == PAIRS[opened.last]
      opened.pop
    elsif opened.any? && PAIRS.values.include?(char)
      return char
      # break
    else
      opened << char
    end
  end
  nil
end

def incomplete_pair(line)
  opened = []
  line.each do |char|
    if opened.any? && char == PAIRS[opened.last]
      opened.pop
    elsif opened.any? && PAIRS.values.include?(char)
      opened = []
      break
    else
      opened << char
    end
  end

  opened.any? ? opened.reverse.map { |char| PAIRS[char] } : nil
end

def corrupted_score(line)
  incomplete_pair(line)&.inject(0) { |score, char| score * 5 + POINTS_2[char] }
end

def part1(input)
  lines = read_input(input)
  illegals = lines.map { |line| illegal_character(line) }.compact
  illegals.map { |char| POINTS_1[char] }.sum
end

def part2(input)
  lines = read_input(input)
  scores = lines.map { |line| corrupted_score(line) }.compact
  scores.sort[scores.size / 2]
end

puts part1('input')
puts part2('input')
