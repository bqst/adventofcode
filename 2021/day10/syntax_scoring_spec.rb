require_relative 'syntax_scoring'

RSpec.describe 'Solving syntax scoring' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(26_397)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(392_043)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(288_957)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(1_605_968_119)
  end
end
