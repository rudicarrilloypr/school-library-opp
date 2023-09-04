# This class is a decorator that modifies the behavior of the correct_name method 
class TrimmerDecorator < Decorator
    def correct_name
      @nameable.correct_name.slice(0, 10)
    end
  end