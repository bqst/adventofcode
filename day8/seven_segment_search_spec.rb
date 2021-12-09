require_relative 'seven_segment_search'

RSpec.describe 'Solving seven segment search' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(26)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(321)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(61_229)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(1_028_926)
  end
end
