# frozen_string_literal: true

module Environment
  def self.create_tileset
    Tileset.new(
      './media/0x72_DungeonTilesetII_v1.4.png',
      tile_width: 16,
      tile_height: 16,
      padding: 16,
      spacing: 0,
      scale: 5
    )
  end

  def self.floor_tiles
    tileset = create_tileset
    8.times do |i|
      x = i / 3
      y = (i % 3).zero? ? 3 : (i % 3) + 3
      tileset.define_tile("floor_#{i + 1}", x, y)
    end

    tileset
  end
end
