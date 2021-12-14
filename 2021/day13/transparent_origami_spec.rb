require_relative 'transparent_origami'

RSpec.describe 'Solving transparent origami' do
  it 'should calculate the example for part 1' do
    expect(part1('example')).to eq(17)
  end

  it 'should calculate the input for part 1' do
    expect(part1('input')).to eq(618)
  end
end
