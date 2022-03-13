# frozen_string_literal: true

FactoryBot.define do
  factory :guess do
    game factory: :game

    code_pegs { 4.times.map { Game::COLOURS.sample } }
  end
end
