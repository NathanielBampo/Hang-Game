class Game < ActiveRecord::Base
  GAME_CHOICE = %w(камень ножницы бумага).freeze

  validates :choice_user, presence: true
  validates :title, presence: true
  validates :choice_pk, presence: true

  before_validation :game_title
  before_validation :game_choice_pk
  before_create :result_for_user

  def game_title
    self.title = "Игра-№#{rand(999)}"
  end

  def game_choice_pk
    self.choice_pk = GAME_CHOICE.sample(1).join('')
  end

  def result_for_user
    self.result = if choice_user == choice_pk
      "Ничья"
    elsif (choice_user == "бумага" && choice_pk == "камень") ||
          (choice_user == "камень" && choice_pk == "ножницы") ||
          (choice_user == "ножницы" && choice_pk == "бумага")
      "Пользователь выиграл"
    else
      "Пользователь проиграл"
    end
  end
end
