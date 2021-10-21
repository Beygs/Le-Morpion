# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'app/player'
require 'app/character'
require 'app/characters'
require 'app/environment'
require 'app/graphic_elements'
require 'app/board'
require 'app/ui'
require 'views/window_display'
require 'views/menus'
require 'views/game_display'

board = Board.new

# binding.pry

window = WindowDisplay.set_window

window.on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y
  
  puts 'left' if event.button == :left
end

WindowDisplay.show_window(Menus.welcome_screen(window))
