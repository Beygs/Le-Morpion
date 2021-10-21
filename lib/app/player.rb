# frozen_string_literal: true

# Classe qui permet de créer un nouveau joueur en lui attribuant un nom et un symbole
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
