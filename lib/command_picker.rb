require_relative 'command_reader'
require_relative 'callable'

class CommandPicker
  include Callable

  def initialize(reader = CommandReader)
    @reader = reader
  end

  def call
    aliases = @reader.call
    return if aliases.empty?

    cmd = select_cmd(aliases)
    return if cmd.nil?

    execute_cmd(cmd)
  end

  private

  def select_cmd(aliases)
    input = aliases.map(&:to_s).join("\n")
    selected, status = Open3.capture2("fzf", stdin_data: input)
    return nil unless status.success?
    aliases.find { |a| a.to_s == selected.strip }
  end

  def execute_cmd(alias_obj)
    if @bash_aliases.include?(alias_obj)
      system(alias_obj.command)
    else
      system("git", *alias_obj.command.split)
    end
  end
end
