require_relative 'hydrothermal_venture'

RSpec.describe 'Solving hydrothermal venture' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(5)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(4_826)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(12)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(16_793)
  end
end
