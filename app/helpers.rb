# frozen_string_literal: true

module Helpers
  def white
    { r: 255, g: 255, b: 255 }
  end

  def inputs
    args.inputs
  end

  def outputs
    args.outputs
  end

  def grid
    args.grid
  end

  def center
    grid.center
  end
end
