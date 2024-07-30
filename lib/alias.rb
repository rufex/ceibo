class Alias
  attr_reader :name, :command, :description

  def initialize(name, command, description = nil)
    @name = name
    @command = command
    @description = description
  end

  def to_s
    description ? "#{name} - #{description}" : name
  end
end
