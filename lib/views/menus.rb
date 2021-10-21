# frozen_string_literal: true

module Menus
  def self.player_name(player_number)
    puts "Joueur #{player_number}, veuillez entrer votre nom :"
    print '> '
    gets.chomp
  end

  def self.welcome_screen(window)
    welcome_screen_characters(window)
    window.add(welcome_screen_overtitle)
    window.add(welcome_screen_title)
    UI.add_play_button(window)
    window
  end

  private

  def self.welcome_screen_characters(window)
    GraphicElements::CHARACTERS.each_with_index do |(_name, sprite), i|
      sprite.y = 80 + ((i % 6) * 80)
      if i < 6
        sprite.x = 120
        flip = nil
      else
        sprite.x = 640
        flip = :horizontal
      end

      window.add(sprite)
      sprite.play animation: :idle, loop: true, flip: flip
    end
  end

  def self.welcome_screen_overtitle
    Text.new(
      'Bienvenue dans',
      x: 300, y: 80,
      font: './fonts/DungeonFont.ttf',
      size: 32,
      color: 'white'
    )
  end

  def self.welcome_screen_title
    Text.new(
      'Le Morpion',
      x: 200, y: 120,
      font: './fonts/DungeonFont.ttf',
      size: 96,
      color: 'white'
    )
  end
end
