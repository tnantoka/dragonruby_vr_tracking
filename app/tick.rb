# frozen_string_literal: true

$game = Game.new

def tick_game(args)
  $game.tick(args)
end

$gtk.reset
