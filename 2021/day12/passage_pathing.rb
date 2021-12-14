require 'set'

class Node

  attr_accessor :name, :size, :paths, :visited

  def initialize(name)
    @name    = name
    @size    = name.upcase.eql?(name) ? :big : :small
    @paths   = []
    @visited = 0
  end

  def add(node)
    @paths << node
  end

  def small?
    @size.eql?(:small)
  end

  def big?
    @size.eql?(:big)
  end

  def can_visit?(twice_done)
    return false if name.eql?('start') && @visited.eql?(1)
    return big? || @visited.eql?(0) || (@visited.eql?(1) && !twice_done)
  end

  def visit_paths(visited_nodes)
    return 1 if @name.eql?('end')
    return 0 if visited_nodes.include?(self)

    visited_nodes << self if small?
    valid_paths = paths.reduce(0) do |path_count, next_node|
      path_count + next_node.visit_paths(visited_nodes)
    end
    visited_nodes.delete(self) if small?
    valid_paths
  end

  def visit_enhanced_paths(twice_done)
    return 1 if @name.eql?('end')
    return 0 if !can_visit?(twice_done)

    @visited += 1
    twice_done ||= small? && @visited > 1
    valid_paths = paths.reduce(0) do |path_count, next_node|
      path_count + next_node.visit_enhanced_paths(twice_done)
    end
    @visited -= 1 if small?
    valid_paths
  end
end

def read_input(filename)
  File.readlines(filename, chomp: true)
end

def part1(input)
  map = Hash.new { |h, k| h[k] = Node.new(k) }

  start_node = map['start']

  read_input(input).each do |line|
    from, to = line.split('-')
    map[from].add(map[to])
    map[to].add(map[from])
  end

  start_node.visit_paths(Set.new)
end

def part2(input)
  map = Hash.new { |h, k| h[k] = Node.new(k) }

  start_node = map['start']

  read_input(input).each do |line|
    from, to = line.split('-')
    map[from].add(map[to])
    map[to].add(map[from])
  end

  start_node.visit_enhanced_paths(false)
end

puts part1('input')
puts part2('input')
