# frozen_string_literal: true

class Game
  include Helpers

  attr_accessor :args, :components

  def initialize
    self.components = [
      Headset.new,
      *%i[left right].map { |type| Hand.new(type) }
    ]
  end

  def tick(args)
    self.args = args

    update
    render

    components.each { |component| component.tick(args) }
  end

  def update; end

  def render
    outputs.background_color = [0, 0, 0]

    render_info
  end

  def render_info
    outputs.labels << info.reverse.map_with_index do |text, i|
      {
        x: center.x,
        y: (center.y * 1.5) + (i * 22),
        text: text,
        alignment_enum: 1,
        **white
      }
    end
  end

  def info
    [
      "headset: (#{position_info(inputs.headset)})",
      "left_hand: (#{position_info(inputs.controller_one.left_hand)})",
      "right_hand: (#{position_info(inputs.controller_one.right_hand)})"
    ]
  end

  def position_info(obj)
    %i[x y z].map { |prop| obj.position.send(prop).round(2).to_s }
             .join(', ')
  end
end
