require_relative 'alias'

class CommandParser
  def initialize; end

  def parse_bash_aliases
    bash_path = ENV['CEIBO_BASH_ALIASES_PATH']
    parse_aliases(bash_path.to_s)
  end

  def parse_git_aliases
    git_path = ENV['CEIBO_GIT_ALIASES_PATH']
    parse_aliases(git_path, git: true)
  end

  private

  def parse_aliases(file_path, git: false)
    aliases = []
    begin
      lines = File.readlines(file_path)
      lines.each_with_index do |line, index|
        if git
          if line.strip.start_with?('[alias]')
            aliases = parse_git_alias_section(lines[index..-1])
            break
          end
        else
          match = line.match(/^alias\s+(\w+)=['"](.+)['"](.*)/)
          if match
            name, command, inline_comment = match.captures
            description = extract_description(lines, index, inline_comment)
            aliases << Alias.new(name, command, description)
          end
        end
      end
    rescue Errno::ENOENT
      puts "Warning: File not found - #{file_path}"
    end
    aliases
  end

  def extract_description(lines, current_index, inline_comment)
    description = inline_comment.strip if inline_comment && !inline_comment.strip.empty?
    return description if description

    prev_line = current_index > 0 ? lines[current_index - 1].strip : nil
    if prev_line && prev_line.start_with?('#')
      return prev_line[1..-1].strip
    end

    nil
  end

  def parse_git_alias_section(lines)
    aliases = []
    in_alias_section = false
    last_comment = nil

    lines.each do |line|
      if line.strip == '[alias]'
        in_alias_section = true
        next
      end
      break if in_alias_section && line.strip.start_with?('[')

      if in_alias_section
        if line.strip.start_with?('#')
          last_comment = line.strip[1..-1].strip
        else
          match = line.match(/^\s*(\w+)\s*=\s*(.+)/)
          if match
            name, command = match.captures
            description = last_comment
            aliases << Alias.new(name, command.strip, description)
            last_comment = nil
          end
        end
      end
    end
    aliases
  end
end
