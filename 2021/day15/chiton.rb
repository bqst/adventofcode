require 'set'

class Node
  attr_accessor :x, :y, :risk

  def initialize(x, y, risk)
    @x         = x
    @y         = y
    @risk      = risk
  end
end

class Graph
  attr_accessor :nodes

  def initialize(nodes)
    @nodes = nodes
  end

  def neighbors(node)
    nodes.select do |n|
      n.x == node.x && n.y == node.y + 1 ||
      n.x == node.x && n.y == node.y - 1 ||
      n.x == node.x + 1 && n.y == node.y ||
      n.x == node.x - 1 && n.y == node.y
    end
  end

  def dijkstra(start, destination)
    distance = {}
    visited  = {}
    queue    = Set.new

    @nodes.each do |node|
      distance[node] = Float::INFINITY
      visited[node]  = false
      queue << node
    end

    distance[start] = 0

    while queue.any?
      current = queue.min_by { |node| distance[node] }

      break if current == destination

      queue.delete(current)

      neighbors(current).each do |neighbor|
        next unless queue.include?(neighbor)

        alt = distance[current] + neighbor.risk

        if alt < distance[neighbor]
          distance[neighbor] = alt
          visited[neighbor]  = current
        end
      end
    end

    distance[destination]
  end
end

def read_input(filename)
  File.readlines(filename, chomp: true)
end

def part1(input)
  lines = read_input(input)
  nodes = []
  lines.first(10).each_with_index do |line, y|
    line.chars.first(10).each_with_index do |risk, x|
      nodes << Node.new(x, y, risk.to_i)
    end
  end
  graph = Graph.new(nodes)
  graph.dijkstra(nodes.first, nodes.last)
end

def part2(input)
  lines = read_input(input)
  nodes = []

  lines.each_with_index do |line, y|
    line.chars.each_with_index do |risk, x|
      nodes << Node.new(x, y, risk.to_i)

      5.times do |i|
        5.times do |j|
          nv = risk.to_i + i + j
          nv -= 9 if nv > 9

          nx = x + line.length * i
          ny = y + lines.length * j

          nodes << Node.new(nx, ny, nv)
        end
      end
    end
  end

  graph = Graph.new(nodes)
  graph.dijkstra(nodes.first, nodes.last)
end

pp part1('input')
pp part2('input')
