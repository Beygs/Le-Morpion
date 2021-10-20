# frozen_string_literal: true

class GameDisplay
  def initialize(players, window)
    @players = players
    @window = window
    @floor = Environment.floor_tiles
    @characters = Characters::CHARACTERS_LIST
  end

  # private

  # def set_window
  #   window = Window.new

  #   window.set({
  #     title: 'Le Morpion',
  #     background: 'black',
  #     width: 800,
  #     height: 640
  #   })

  #   window
  # end

  # def show_window(window)
  #   @window.show
  # end

  #   Characters::CHARACTERS_LIST.each do |char, char_sprite|
  #     char_sprite.x = rand(0..500)
  #     char_sprite.y = rand(0..500)
  #     w.add(char_sprite)
  #     char_sprite.play animation: :idle, loop: true
  #   end

  #   floor = Environment.floor_tiles

  #   floor.set_tile('floor_1', [{x: 0, y: 0}])

  #   w.add(floor)

  #   w.show
  # end
end
