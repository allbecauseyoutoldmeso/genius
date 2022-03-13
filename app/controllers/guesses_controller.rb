# frozen_string_literal: true

class GuessesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    game.guesses.create(guess_params)
    redirect_to(game_path(game))
  end

  private

  def guess_params
    params.require(:guess).permit(code_pegs: [])
  end
end
