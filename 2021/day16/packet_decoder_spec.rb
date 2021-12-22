require_relative 'packet_decoder'

RSpec.describe 'Solving packet decoder' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(31)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(940)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(54)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(13_476_220_616_073)
  end
end
