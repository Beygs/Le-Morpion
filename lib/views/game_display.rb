# frozen_string_literal: true

# Classe qui gère tout l'affichage dans la fenêtre et la logique générale du jeu
class GameDisplay
  attr_accessor :window

  def initialize(window, players)
    @window = window
    @players = players
    @board = Board.new
    @squares = place_collision_blocks
    @menu = true
    @turn = 0
    @hit_sound = Sound.new('./media/hit.wav')
    @morpion_music = Music.new('./media/morpion.wav')
    reset_toggle
  end

  def self.player_name(player_number)
    puts "Joueur #{player_number}, veuillez entrer votre nom :"
    print '> '
    gets.chomp
  end

  def welcome_screen
    welcome_screen_characters
    @window.add(welcome_screen_overtitle)
    @window.add(welcome_screen_title)
    UI.add_play_button(@window, @players, self)
    @morpion_music.loop = true
    @morpion_music.play

    @window
  end

  def gameplay
    @window.clear
    @morpion_music.fadeout(500)
    welcome_screen_characters
    show_tiles
    show_turn_of
    show_player
    show_board
    @window
  end

  def detect_click(button)
    @window.on :mouse_down do |event|
      if @menu
        menu_detect(button, event)
      else
        @squares.each_with_index do |square, id|
          play(id) if square.contains?(event.x, event.y)
        end
      end
    end
  end

  def play(id)
    y = id / 3
    x = id % 3
    if @board.free_square?(y, x)
      @board.play_move(y, x, @players[@turn % 2].symbol)

      next_turn
    end
  end

  def next_turn
    case @board.check_for_win
    when '?'
      @turn += 1
      @hit_sound.play
      gameplay
    when 'X' then winning_screen(0)
    when 'O' then winning_screen(1)
    when 'tie' then tie_screen
    end
  end

  def winning_screen(player_id)
    @window.clear
    welcome_screen_characters
    @window.add(winning_message(player_id))
    @window.add(reset_game_text)
    @morpion_music.play
  end

  def winning_message(player_id)
    Text.new(
      "#{@players[player_id].name} a gagne !",
      x: 200, y: 120,
      font: './fonts/press_start_2p.ttf',
      size: 20,
      color: 'white'
    )
  end

  def tie_screen
    @window.clear
    welcome_screen_characters
    @window.add(tie_message)
    @window.add(reset_game_text)
    @morpion_music.play
  end

  def tie_message
    Text.new(
      "Match nul !",
      x: 200, y: 120,
      font: './fonts/press_start_2p.ttf',
      size: 20,
      color: 'white'
    )
  end

  def reset_game_text
    Text.new(
      'Appuie sur r pour rejouer',
      x: 200, y: 200,
      font: './fonts/press_start_2p.ttf',
      size: 16,
      color: 'white'
    )
  end

  def menu_detect(button, event)
    if button.contains?(event.x, event.y)
      gameplay
      @menu = false
    end
  end

  def reset_toggle
    @window.on :key_down do |event|
      reset_game if event.key == 'r'
    end
  end

  def reset_game
    @turn = 0
    @board = Board.new
    @window.clear
    gameplay
  end

  private

  def welcome_screen_characters
    Characters::CHARACTERS_LIST.each_with_index do |(_name, sprite), i|
      sprite.y = 80 + ((i % 6) * 80)
      if i < 6
        sprite.x = 120
        flip = nil
      else
        sprite.x = 640
        flip = :horizontal
      end

      @window.add(sprite)
      sprite.play animation: :idle, loop: true, flip: flip
    end
  end

  def place_collision_blocks
    squares = []
    (0..2).each do |j|
      (0..2).each do |i|
        x = i * 80 + 280
        y = j * 80 + 280
        squares << Square.new(x: x, y: y, size: 80, color: 'red')
      end
    end
    squares
  end

  def show_tiles
    floor = Environment.floor_tiles
    @window.add(select_tiles(floor))
  end

  def show_turn_of
    @window.add(Text.new(
                  'Au tour de',
                  x: 280, y: 80,
                  font: './fonts/press_start_2p.ttf',
                  size: 20,
                  color: 'white'
                ))
  end

  def show_player
    @window.add(Text.new(
                  @players[@turn % 2].name,
                  x: 280, y: 120,
                  font: './fonts/press_start_2p.ttf',
                  size: 32,
                  color: 'white'
                ))
  end

  def show_board
    (0..2).each do |j|
      (0..2).each do |i|
        x = i * 80 + 296
        y = j * 80 + 296
        @window.add(define_board_symbols(j, i, x, y))
      end
    end
  end

  def define_board_symbols(j, i, x, y)
    Text.new(
      @board.board_array[j][i],
      x: x, y: y,
      font: './fonts/press_start_2p.ttf',
      size: 56,
      color: 'white'
    )
  end

  def select_tiles(tiles)
    (0..2).each do |j|
      (0..2).each do |i|
        x = i * 80 + 280
        y = j * 80 + 280
        tiles.set_tile("floor_#{rand(1..8)}", [{ x: x, y: y }])
      end
    end

    tiles
  end

  def welcome_screen_overtitle
    Text.new(
      'Bienvenue dans',
      x: 270, y: 80,
      font: './fonts/press_start_2p.ttf',
      size: 20,
      color: 'white'
    )
  end

  def welcome_screen_title
    Text.new(
      'Le Morpion',
      x: 200, y: 120,
      font: './fonts/DungeonFont.ttf',
      size: 96,
      color: 'white'
    )
  end
end
