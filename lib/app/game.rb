# frozen_string_literal: true

class Game
  def initialize
    @players = []
    @window = WindowDisplay.set_window
    @game_display = nil
  end

  def perform
    beginning
    game_display
    WindowDisplay.show_window(@window)
  end

  def beginning
    system 'clear'

    puts 'Salut, et bienvenue dans le Morpion !'
    wait_return

    rules
    wait_return

    system 'clear'

    puts 'Tu as compris ?'
    wait_return

    players_signin

    startup
  end

  def players_signin
    system 'clear'

    puts 'Ok génial !'
    puts 'Avant de commencer, faisons un peu connaissance...'
    wait_return

    player1_signin
    player2_signin
  end

  def startup
    system 'clear'

    puts 'Bon, on peut commencer !'
    wait_return

    suspens
  end

  def suspens
    system 'clear'

    puts '...'
    wait_return

    system 'clear'

    puts "T'en as pas marre du terminal toi ?"
    wait_return

    system 'clear'

    puts 'Moi si'

    sleep 1.5
  end

  def game_display
    welcome_screen
  end

  def welcome_screen
    @game_display = GameDisplay.new(@window, @players)
    @window = @game_display.welcome_screen
  end

  private

  def player1_signin
    system 'clear'

    puts "C'est quoi ton petit nom ?"
    puts

    @players << Player.new(GameDisplay.player_name(1), 'X')
  end

  def player2_signin
    system 'clear'

    puts "Et c'est qui qui joue avec toi ?"
    puts

    @players << Player.new(GameDisplay.player_name(2), 'O')
  end

  def rules
    system 'clear'

    puts 'Voici les règles :'
    puts
    puts "Le jeu ne se joue qu'à deux joueurs humains."
    puts 'Le plateau de jeu est composé de 9 cases.'
    puts "Les joueurs jouent à tour de rôle jusqu'à que l'un"
    puts "d'eux gagne ou que le plateau de jeu soit rempli."
    puts 'Pour gagner, il faut aligner trois de vos symboles sur la grille.'
    puts "Si toutes les cases sont remplies mais que personne n'est vainqueur,"
    puts 'il y a match nul.'
  end

  def wait_return
    puts
    puts 'Appuie sur Entrée pour continuer'

    loop do
      case $stdin.getch
      when "\r" then break
      when 'q' then exit
      end
    end
  end
end