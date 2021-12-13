require_relative 'dumbo_octopus'

RSpec.describe 'Solving dumbo octopus' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(1_656)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(1_599)
  end

  it 'should calculate the example for part 2' do
    expect(part2('example')).to eq(195)
  end

  it 'should calculate the input for part 2' do
    expect(part2('input')).to eq(418)
  end
end
