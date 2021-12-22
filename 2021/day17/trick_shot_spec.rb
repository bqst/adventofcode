require_relative 'trick_shot'

RSpec.describe 'Solving trick shot' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(45)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(5_253)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(112)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(1770)
  end
end
