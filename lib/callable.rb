module Callable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def call(...)
      new(...).call
    end
  end

  def call
    raise NotImplementedError, "#{self.class} must implement the 'call' method"
  end
end
