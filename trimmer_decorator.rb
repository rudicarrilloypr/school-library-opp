# frozen_string_literal: true

# This class is a decorator that modifies the behavior of the correct_name method
class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name.slice(0, 10) : name
  end
end
