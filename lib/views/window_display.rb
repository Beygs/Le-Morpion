# frozen_string_literal: true

module WindowDisplay
  def self.set_window
    window = Window.new

    window.set({
                 title: 'Le Morpion',
                 background: 'black',
                 width: 816,
                 height: 624
               })

    window
  end

  def self.show_window(window)
    window.show
  end
end
