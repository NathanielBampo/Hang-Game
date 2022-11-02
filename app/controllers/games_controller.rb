class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.create(user_choice)
    
    if @game.save
      redirect_to game_path(@game), notice: "Ваш результат!"
    else
      render :new, notice: "Что-то пошло не так и игра не удалась."
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  private

  def user_choice
    params.require(:game).permit(:choice_user, :title)
  end
end
