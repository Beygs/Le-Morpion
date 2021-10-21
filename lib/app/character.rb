# frozen_string_literal: true

# Classe permettant de créer un personnage et de mettre en place ses animations
class Character
  attr_accessor :sprite

  def initialize(x_idle, y_idle, x_run, y_run)
    @spritesheet = './media/0x72_DungeonTilesetII_v1.4.png'
    @sprite = Sprite.new(
      @spritesheet,
      width: 48,
      height: 48,
      animations: {
        idle: animation(x_idle, y_idle),
        run: animation(x_run, y_run)
      }
    )
  end

  def animation(x_pos, y_pos)
    animation_array = []

    4.times do
      animation_array << {
        x: x_pos, y: y_pos,
        width: 16, height: 16,
        time: 200
      }
      x_pos += 16
    end

    animation_array
  end
end
