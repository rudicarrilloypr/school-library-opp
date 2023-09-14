require_relative 'Decorator'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    @nameable = nameable
    super(nameable)
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
