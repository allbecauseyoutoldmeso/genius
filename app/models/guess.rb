# frozen_string_literal: true

class Guess < ApplicationRecord
  belongs_to :game

  validates :code_pegs, presence: true, code_pegs: true

  delegate :code_pegs, to: :game, prefix: :game

  def key_pegs
    code_pegs.each_with_index.map do |code_peg, index|
      if game_code_pegs[index] == code_peg
        'black'
      elsif white_key_peg?(code_peg, index)
        'white'
      end
    end
  end

  private

  def white_key_peg?(code_peg, index)
    (uncounted_code_pegs.tally[code_peg] || 0) > (code_pegs[0...index].tally[code_peg] || 0)
  end

  def uncounted_code_pegs
    game_code_pegs.each_with_index.select do |game_code_peg, index|
      code_pegs[index] != game_code_peg
    end.map(&:first)
  end
end
