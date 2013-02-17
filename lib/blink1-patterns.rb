require "blink1"

module Blink
  module Patterns
    def self.breath(hex = "#0000ff", duration = 5, depth = 0.2) 
      Blink1.open do |blink|
        blink.set_rgb(*Blink::Patterns.to_rgb(hex))
      end
    end

    def self.police
    end

    def self.to_rgb(hex_color)
      hex_color.gsub('#','').scan(/../).map {|color| color.hex}
    end
  end
end


#  def initialize
#    blink.open
#  end

#  def finalize
#    puts "Closing Blink1 Connection"
#    blink.off
#    blink.close
#  end

#  def breath(hex = "#0000ff", duration = 5, depth = 0.2) 
#    play(animate_breath(hex, duration, depth))
#  end

#  def police
#    animation = animate_breath("#ff0000", 0.5, 1) + animate_breath("#0000ff", 0.5, 1) 
#    play(animation)
#  end

#  def play(animation, step = 0)
#    timer.cancel if timer

#    step = 0 if step >= animation.length
#    r, g, b, t = animation[step] 

#    @timer = after(t) do
#      play(animation, step + 1)
#    end

#    blink.fade_to_rgb(t*1000, r, g, b)
#  end


#  # Amount should be a decimal between 0 and 1. Lower means darker
#  def darken_color(hex_color, amount=0.4)
#    hex_color = hex_color.gsub('#','')
#    rgb = hex_color.scan(/../).map {|color| color.hex}
#    rgb[0] = (rgb[0].to_i * amount).round
#    rgb[1] = (rgb[1].to_i * amount).round
#    rgb[2] = (rgb[2].to_i * amount).round
#    rgb
#  end

#  # Amount should be a decimal between 0 and 1. Higher means lighter



#  def animate_breath(hex = "#0000ff", duration = 5, depth = 0.2) 
#    breath_in_duration  = 1.0
#    breath_out_duration = 1.3 

#    breath_in_interval  = 0.1 * duration * breath_in_duration  / (breath_in_duration + breath_out_duration)
#    breath_out_interval = 0.1 * duration * breath_out_duration / (breath_in_duration + breath_out_duration)

#    ease_in   = [1.0000, 0.9933, 0.9707, 0.9277, 0.8573, 0.7487, 0.5872, 0.3685, 0.1541, 0.0325, 0.0000].map{|v| [v, breath_in_interval] }
#    ease_out  = [1.0000, 0.9859, 0.9426, 0.8694, 0.7666, 0.6362, 0.4841, 0.3212, 0.1664, 0.0476, 0.0000].reverse.map{|v| [v, breath_out_interval] }

#    (ease_in + ease_out).map do |v, t|
#      darken_color(hex, 1 - (v * depth)) << t
#    end
#  end

#  private

#  def blink
#    @@blink ||= Blink1.new
#  end
#end
