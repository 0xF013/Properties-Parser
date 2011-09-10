require './lib/strategies/base_strategy'
class PropertiesStrategy < BaseStrategy
  def parse (lines)
    properties = {}
    lines.each do |line|
        line.strip!
        if (line[0] != ?# and line[0] != ?=)
          i = line.index('=')
          if (i)
            properties[line[0..i - 1].strip] = line[i + 1..-1].strip
          else
            properties[line] = ''
          end
        end
    end
    properties
  end
end
