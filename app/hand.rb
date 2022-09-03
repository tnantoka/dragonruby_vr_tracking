# frozen_string_literal: true

class Hand
  include Helpers

  attr_accessor :args, :type, :tracks

  def initialize(type)
    self.type = type
    self.tracks = []
  end

  def tick(args)
    self.args = args
    update
    render
  end

  def update
    record_track
  end

  def render
    outputs.lines << lines
    outputs.sprites << sprite
  end

  def position
    inputs.controller_one.send("#{type}_hand").position
  end

  def record_track
    tracks << { x: position.x, y: position.y, z: position.z }
    tracks.shift if tracks.size > 20
  end

  def sprite
    {
      x: center.x + (grid.w * position.x),
      y: center.y + (grid.h * position.y),
      z: center.x + (grid.w * position.z),
      w: 32,
      h: 32,
      path: "sprites/#{type}.png"
    }
  end

  def lines
    tracks.each_slice(2).map do |track1, track2|
      next if track2.nil?

      {
        **line_position(track1, ''),
        **line_position(track2, '2'),
        **white
      }
    end.compact
  end

  def line_position(track, suffix)
    {
      "x#{suffix}": center.x + (grid.w * track[:x]) + 16,
      "y#{suffix}": center.y + (grid.h * track[:y]) + 16,
      "z#{suffix}": center.x + (grid.w * track[:z])
    }
  end
end
