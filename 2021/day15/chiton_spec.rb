require_relative 'chiton'

RSpec.describe 'Solving chiton' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(40)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(824)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(315)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(3_063)
  end
end
