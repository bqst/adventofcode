require_relative 'lanternfish'

RSpec.describe 'Solving lanternfish' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(5934)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(380_612)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(26_984_457_539)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(1_710_166_656_900)
  end
end
