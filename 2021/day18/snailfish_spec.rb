require_relative 'snailfish'

RSpec.describe 'Solving snailfish' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(4_140)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(4_347)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(3_993)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(4_721)
  end
end
