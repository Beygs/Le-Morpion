# frozen_string_literal: true

class GameDisplay
  attr_accessor :window

  def initialize(window, players)
    @window = window
    @players = players
    @board = Board.new
    @squares = place_collision_blocks
    @menu = true
    @turn = 0
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

    @window
  end

  def gameplay
    @window.clear
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
          if square.contains?(event.x, event.y)
            play(id)
          end
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
      gameplay
    when 'X' then puts 'X Gagne !'
    when 'O' then puts 'O Gagne !'
    when 'tie' then puts 'Match nul'
    end
  end

  def menu_detect(button, event)
    if button.contains?(event.x, event.y)
      gameplay
      @menu = false
    end
  end

  private

  def welcome_screen_characters
    GraphicElements::CHARACTERS.each_with_index do |(_name, sprite), i|
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
    for j in 0..2
      for i in 0..2
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
    for j in 0..2
      for i in 0..2
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
    for j in 0..2
      for i in 0..2
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
      x: 300, y: 80,
      font: './fonts/DungeonFont.ttf',
      size: 32,
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
