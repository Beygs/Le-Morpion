# frozen_string_literal: true

# Module qui regroupe tous les personnages
module Characters
  CHARACTERS_LIST = {
    tiny_zombie: Character.new(368, 16, 432, 16).sprite,
    goblin: Character.new(368, 32, 432, 32).sprite,
    imp: Character.new(368, 48, 432, 48).sprite,
    skelet: Character.new(368, 80, 432, 80).sprite,
    muddy: Character.new(368, 112, 368, 112).sprite,
    swampy: Character.new(432, 112, 432, 112).sprite,
    zombie: Character.new(368, 144, 368, 144).sprite,
    ice_zombie: Character.new(432, 144, 432, 144).sprite,
    masked_orc: Character.new(368, 172, 432, 172).sprite,
    orc_warrior: Character.new(368, 204, 432, 204).sprite,
    orc_shaman: Character.new(368, 236, 432, 236).sprite,
    necromancer: Character.new(368, 268, 368, 268).sprite
  }.freeze
end
