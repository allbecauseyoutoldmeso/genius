# frozen_string_literal: true

require 'rails_helper'

describe Game do
  describe '#valid?' do
    let(:game) { build(:game) }

    it 'is true for factory' do
      expect(game.valid?).to eq(true)
    end

    it 'sets code_pegs' do
      game.valid?

      expect(game.code_pegs.present?).to eq(true)
    end
  end
end
