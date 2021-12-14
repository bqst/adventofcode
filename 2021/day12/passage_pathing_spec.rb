require_relative 'passage_pathing'

RSpec.describe 'Solving passage pathing' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(226)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(3_887)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(3_509)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(104_834)
  end
end
