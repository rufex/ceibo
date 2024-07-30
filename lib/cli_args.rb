  require 'optparse'
  require_relative 'callable'
  
  class CliArgs
    include Callable
    
    def initialize; end
    
    def call
      parse_args
    end

    private

    def parse_args
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: #{$PROGRAM_NAME} [options]"

        opts.on("-g", "--git", "Only show git aliases") do
          options[:git_only] = true
        end

        opts.on("-a", "--aliases", "Only show bash aliases") do
          options[:bash_only] = true
        end

        opts.on("-h", "--help", "Show this help message") do
          puts opts
          exit
        end
      end.parse!
      options
    end
  end
