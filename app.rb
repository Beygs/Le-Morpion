# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'app/game'
require 'app/player'
require 'app/character'
require 'app/characters'
require 'app/environment'
require 'app/graphic_elements'
require 'app/board'
require 'app/ui'
require 'views/window_display'
require 'views/game_display'

Game.new.perform
