require_relative 'the_treachery_of_whales'

RSpec.describe 'Solving The Treachery of Whales' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(37)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(336_131)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(168)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(92_676_646)
  end
end
