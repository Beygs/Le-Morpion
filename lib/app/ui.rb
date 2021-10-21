# frozen_string_literal: true

module UI
  FRAME_BORDER = Image.new(
    './media/frame_border.png',
    width: 32,
    height: 32
  )

  FRAME_LINE = Image.new(
    './media/frame_line.png',
    width: 32,
    height: 32
  )

  BACKGROUND = Image.new(
    './media/background.png',
    width: 32,
    height: 32
  )

  SELECTOR = Image.new(
    './media/selector.png',
    width: 80,
    height: 80
  )

  def self.add_play_button(window, players, game_display)
    button_frame(window, players, game_display)
    play_button_text(window)
  end

  def self.button_frame(window, _players, game_display)
    button_frame_borders(window)
    button_frame_lines(window)
    button_background(window)
    collision = add_button_collision
    detect_click(game_display, collision)
  end

  def self.add_button_collision
    Rectangle.new(
      x: 296, y: 336,
      width: 200, height: 80
    )
  end

  def self.detect_click(game_display, button)
    game_display.detect_click(button)
  end

  def self.button_background(window)
    background = BACKGROUND.dup
    background.x = 296
    background.y = 336
    background.width = 200
    background.height = 80
    window.add(background)
  end

  def self.button_frame_borders(window)
    window.add(button_frame_border_top_right)
    window.add(button_frame_border_top_left)
    window.add(button_frame_border_bottom_right)
    window.add(button_frame_border_bottom_left)
  end

  def self.button_frame_border_top_right
    top_right = FRAME_BORDER.dup
    top_right.x = 280
    top_right.y = 320
    top_right.z = 999
    top_right
  end

  def self.button_frame_border_top_left
    top_left = FRAME_BORDER.dup
    top_left.x = 480
    top_left.y = 320
    top_left.z = 999
    top_left.rotate = 90
    top_left
  end

  def self.button_frame_border_bottom_right
    bottom_right = FRAME_BORDER.dup
    bottom_right.x = 280
    bottom_right.y = 400
    bottom_right.z = 999
    bottom_right.rotate = 270
    bottom_right
  end

  def self.button_frame_border_bottom_left
    bottom_left = FRAME_BORDER.dup
    bottom_left.x = 480
    bottom_left.y = 400
    bottom_left.z = 999
    bottom_left.rotate = 180
    bottom_left
  end

  def self.button_frame_lines(window)
    window.add(button_frame_line_top)
    window.add(button_frame_line_bottom)
    window.add(button_frame_line_right)
    window.add(button_frame_line_left)
    window
  end

  def self.button_frame_line_top
    top_line = FRAME_LINE.dup
    top_line.x = 280
    top_line.y = 320
    top_line.z = 980
    top_line.width = 200
    top_line
  end

  def self.button_frame_line_bottom
    bottom_line = FRAME_LINE.dup
    bottom_line.x = 280
    bottom_line.y = 400
    bottom_line.z = 980
    bottom_line.width = 200
    bottom_line.rotate = 180
    bottom_line
  end

  def self.button_frame_line_right
    right_line = FRAME_LINE.dup
    right_line.x = 256
    right_line.y = 360
    right_line.z = 980
    right_line.width = 80
    right_line.rotate = 270
    right_line
  end

  def self.button_frame_line_left
    left_line = FRAME_LINE.dup
    left_line.x = 456
    left_line.y = 360
    left_line.z = 980
    left_line.width = 80
    left_line.rotate = 90
    left_line
  end

  def self.play_button_text(window)
    play = Text.new(
      'Jouer',
      x: 344, y: 352,
      font: './fonts/DungeonFont.ttf',
      size: 48,
      color: 'black'
    )
    window.add(play)
  end
end
