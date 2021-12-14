def read_input(filename)
  File.readlines(filename, chomp: true)
end

def part1(input)
  input    = read_input(input)
  template = input.first
  rules    = (input - [input.first]).reject!(&:empty?).map { |rule| rule.split(' -> ') }.to_h

  10.times do
    template = template.chars.each_cons(2).reduce([]) do |acc, chars|
      a, b = chars[0], chars[1]

      pair = [a, b].join
      if acc.empty?
        acc << [a, rules[pair], b]
      else
        acc << [rules[pair], b]
      end
      acc
    end.join
  end

  element_counts = template.each_char.tally

  element_counts.values.max - element_counts.values.min
end

# can't use part 1, because it's too slow
# found solution thanks to https://github.com/elmward/adventofcode2021/blob/master/day14/part2.rb
def part2(input)
  input = read_input(input)
  template = input.first

  rules = (input - [input.first]).reject!(&:empty?).map { |rule| rule.split(' -> ') }.to_h

  element_counts = template.chars.tally
  pair_counts    = template.chars.each_cons(2).tally

  40.times do
    pair_counts = Hash.new(0).tap do |new_counts|
      pair_counts.each do |pair, old_count|
        char = rules[pair.join]
        next unless char

        new_counts[[pair[0], char]] += old_count
        new_counts[[char, pair[1]]] += old_count
        element_counts[char] = (element_counts[char] || 0) + old_count
      end
    end
  end

  element_counts.values.max - element_counts.values.min
end

pp part1('input')
pp part2('input')
