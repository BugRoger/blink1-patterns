require "blink1"

module Blink
  module Patterns
    
    def self.breath(hex_color = "#0000ff", length = 5, depth = 0.3) 
      brightness = [0.0000, 0.0293, 0.1427, 0.4128, 0.8459, 1.0000, 0.8336, 0.5159, 0.2334, 0.0574, 0.0141, 0.0000]
      interval   = [1.5,    1.0,    1.0,    1.0,    1.2,    1.5,    1.2,    1.2,    1.2,    1.2,    1.2,    0.0]
      stretch    = length / interval.inject(:+) 

      Blink1.open do |blink|
        (0..11).each do |pos|
          color    = Blink::Patterns.darken(hex_color, (1 - brightness[pos]) * depth)
          duration = (stretch * interval[pos] * 1000).to_i
          blink.write_pattern_line(duration, *color, pos)
        end
        blink.play(0)
      end
    end

    def self.police
      Blink1.open do |blink|
        blink.write_pattern_line(500, *Blink::Patterns.to_rgb("#000000"), 0)
        blink.write_pattern_line(100, *Blink::Patterns.to_rgb("#ff0000"), 1)
        blink.write_pattern_line(500, *Blink::Patterns.to_rgb("#000000"), 2)
        blink.write_pattern_line(100, *Blink::Patterns.to_rgb("#0000ff"), 3)
        blink.write_pattern_line(0, 0, 0, 0, 4)
        blink.write_pattern_line(0, 0, 0, 0, 5)
        blink.write_pattern_line(0, 0, 0, 0, 6)
        blink.write_pattern_line(0, 0, 0, 0, 7)
        blink.write_pattern_line(0, 0, 0, 0, 8)
        blink.write_pattern_line(0, 0, 0, 0, 9)
        blink.write_pattern_line(0, 0, 0, 0, 10)
        blink.write_pattern_line(0, 0, 0, 0, 11)
        blink.play(0)
      end 
    end

    def self.off
      Blink1.open do |blink|
        blink.off
      end
    end

    def self.to_rgb(hex_color)
      hex_color.gsub('#','').scan(/../).map {|color| color.hex}
    end

     def self.darken(hex_color, amount=0.4)
       to_rgb(hex_color).map { |c| (c * (1 - amount)).round }
     end
  end
end
