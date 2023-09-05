# frozen_string_literal: true

# This class is a decorator that modifies the behavior of the correct_name method
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
