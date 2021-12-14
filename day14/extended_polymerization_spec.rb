require_relative 'extended_polymerization'

RSpec.describe 'Solving extendted polymerization' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(1_588)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(2_937)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(2_188_189_693_529)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(3_390_034_818_249)
  end
end
