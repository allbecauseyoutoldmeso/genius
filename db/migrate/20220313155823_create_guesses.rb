# frozen_string_literal: true

class CreateGuesses < ActiveRecord::Migration[7.0]
  def change
    create_table :guesses do |t|
      t.references :game
      t.jsonb :code_pegs
      t.timestamps
    end
  end
end
