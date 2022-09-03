# frozen_string_literal: true

class Headset
  include Helpers

  attr_accessor :args

  def tick(args)
    self.args = args
    update
    render
  end

  def update; end

  def render
    outputs.solids << solid
  end

  def solid
    {
      x: center.x + (grid.w * position.x) - 32,
      y: center.y + (grid.h * position.y) - 16,
      z: grid.w * position.z,
      w: 64,
      h: 32,
      **white
    }
  end

  def position
    inputs.headset.position
  end
end
