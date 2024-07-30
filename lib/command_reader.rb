require_relative 'command_parser'
require_relative 'callable'
require_relative 'cli_args'

class CommandReader
  include Callable

  def initialize(parser = CommandParser.new, options = CliArgs.call)
    @parser = parser
    @options = options
    @bash_aliases = @options[:bash_only] || !@options[:git_only] ? @parser.parse_bash_aliases : []
    @git_aliases = @options[:git_only] || !@options[:bash_only] ? @parser.parse_git_aliases : []
  end

  def call
    present_options
  end

  private

  def present_options
    all_aliases = @bash_aliases + @git_aliases
    if all_aliases.empty?
      puts "No aliases found."
      return
    end
    all_aliases.sort_by!(&:to_s)
  end
end
