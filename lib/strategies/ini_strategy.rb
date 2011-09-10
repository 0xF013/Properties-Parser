require './lib/strategies/base_strategy'
class INIStrategy < BaseStrategy
  
  def parse (lines)
    current_section = nil
    data = {}
    lines.each do |line|
        if !line.empty? 
          case line
            when /^\[(.*)\]$/
              current_section = $1
              if data.has_key?( current_section ) == false
                data[current_section] = {}
              end
            when /^([^=]+?)=/
              key = $1.strip
              value = $'.strip
              raise IniFileSectionUndefined if current_section.nil?
              data[current_section][key] = value
          end
        end
    end
    data
  end  
  
end
