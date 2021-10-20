# frozen_string_literal: true

# frozen_stirng_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'app/player'
require 'app/character'
require 'app/characters'
require 'app/environment'
require 'app/graphic_elements'
require 'app/ui'
require 'views/window_display'
require 'views/menus'
require 'views/game_display'

window = WindowDisplay.set_window

WindowDisplay.show_window(Menus.welcome_screen(window))
