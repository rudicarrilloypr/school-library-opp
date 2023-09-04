# This class acts as a base decorator for Nameable objects. It encapsulates the Nameable object
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
