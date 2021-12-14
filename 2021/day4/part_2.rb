require 'matrix'

lines   = File.read('input').split("\n").reject(&:empty?)
numbers = lines.shift.split(',').map(&:to_i)
boards  = lines.each_slice(5).to_a.map { |b| b.map { |l| l.split.map(&:to_i) } }.map { |b| Matrix[*b] }
won_boards = boards.dup

numbers.each do |n|
  boards.each do |board|
    board.map! { |e| e.eql?(n) ? 0 : e }

    if board.row_vectors.any? { |r| r.sum.eql?(0) } || board.column_vectors.any? { |c| c.sum.eql?(0) }

      if won_boards.size.eql?(1) && won_boards[0].eql?(board)
        puts n * board.sum
        exit
      end

      won_boards.delete(board)
    end
  end
end
