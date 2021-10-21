# frozen_string_literal: true

class GameDisplay
  def initialize(players, window)
    @players = players
    @window = window
    @floor = Environment.floor_tiles
    @characters = Characters::CHARACTERS_LIST
  end

  
end
