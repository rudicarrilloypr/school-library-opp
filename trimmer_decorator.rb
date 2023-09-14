require_relative 'Decorator'

class TrimmerDecorator < Decorator
  def initialize(nameable, max_length = 10)
    @nameable = nameable
    @max_length = max_length
    super(nameable)
  end

  def correct_name
    @nameable.correct_name.slice(0, @max_length)
  end
end
