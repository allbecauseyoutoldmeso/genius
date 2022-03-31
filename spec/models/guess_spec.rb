# frozen_string_literal: true

require 'rails_helper'

describe Guess do
  it_behaves_like 'code_pegs_validator' do
    let(:subject) { build(:guess) }
  end

  describe '#valid?' do
    it 'is true for factory' do
      guess = build(:guess)
      expect(guess.valid?).to eq(true)
    end
  end

  describe '#key_pegs' do
    let(:game) { create(:game, code_pegs: %w[red yellow green blue]) }
    let(:guess) { create(:guess, game: game, code_pegs: guess_code_pegs) }

    context 'correct code pegs in correct positions' do
      let(:guess_code_pegs) { %w[red yellow green blue] }

      it 'returns black key pegs' do
        expect(guess.key_pegs).to eq(%w[black black black black])
      end
    end

    context 'correct code pegs in incorrect positions' do
      let(:guess_code_pegs) { %w[yellow red blue green] }

      it 'returns white key pegs' do
        expect(guess.key_pegs).to eq(%w[white white white white])
      end
    end

    context 'incorrect code pegs' do
      let(:guess_code_pegs) { %w[pink pink pink pink] }

      it 'returns white key pegs' do
        expect(guess.key_pegs).to eq([nil, nil, nil, nil])
      end
    end

    context 'more than one correct code peg in incorrect position' do
      let(:guess_code_pegs) { %w[yellow red yellow blue] }

      it 'returns white key pegs' do
        expect(guess.key_pegs).to eq(['white', 'white', nil, 'black'])
      end
    end
  end
end
