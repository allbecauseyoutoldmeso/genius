# frozen_string_literal: true

class Game < ApplicationRecord
  COLOURS = %w[red orange yellow green blue pink]

  before_validation :set_code_pegs
  validates :code_pegs, presence: true, code_pegs: true

  has_many :guesses

  private

  def set_code_pegs
    self.code_pegs ||= 4.times.map { COLOURS.sample }
  end
end
