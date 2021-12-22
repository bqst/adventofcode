class Packet
  attr_reader :bits, :version, :type_id, :value, :length_type_id

  def initialize(bits)
    @bits    = bits
    @value   = nil
    @packets = []

    parse!
  end

  def versions
    @packets.map(&:versions).flatten + [version]
  end

  def parse!
    @version = @bits.slice!(0, 3).to_i(2)
    @type_id = @bits.slice!(0, 3).to_i(2)

    if type_id.eql?(4)
      parse_literal!
    else
      parse_operator!
    end
  end

  def parse_literal!
    parts   = []
    marker  = '1'
    until marker.eql?('0')
      marker = @bits.slice!(0, 1)
      parts.push(@bits.slice!(0, 4))
    end
    @value = parts.join.to_i(2)
  end

  def parse_operator!
    @length_type_id = @bits.slice!(0, 1)
    @length_type_id.eql?('0') ? parse_operator_length! : parse_operator_count!
  end

  def parse_operator_length!
    sub_packet_bit_length = @bits.slice!(0, 15).to_i(2)
    sub_packet_bits = @bits.slice!(0, sub_packet_bit_length)
    @packets.push(Packet.new(sub_packet_bits)) until sub_packet_bits.empty?
  end

  def parse_operator_count!
    sub_packet_count = @bits.slice!(0, 11).to_i(2)
    sub_packet_count.times do
      @packets.push(Packet.new(@bits))
    end
  end

  def calculate
    values = @packets.map(&:calculate)
    case @type_id
    when 0 then values.sum
    when 1 then values.reduce(:*)
    when 2 then values.min
    when 3 then values.max
    when 4 then value
    when 5 then values.first > values.last ? 1 : 0
    when 6 then values.first < values.last ? 1 : 0
    when 7 then values.first == values.last ? 1 : 0
    end
  end
end

def read_input(filename)
  File.readlines(filename, chomp: true)
end

def part1(input)
  input = read_input(input)
  Packet.new(input.pack('H*').unpack1('B*')).versions.inject(:+)
end

def part2(input)
  input = read_input(input)
  Packet.new(input.pack('H*').unpack1('B*')).calculate
end

pp part1('input')
pp part2('input')
