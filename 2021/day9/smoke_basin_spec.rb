require_relative 'smoke_basin'

RSpec.describe 'Solving smoke basin search' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(15)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(588)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(1_134)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(964_712)
  end
end
