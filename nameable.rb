# This class represents a basic contract for objects that can have a correctable name.
class Nameable
    def correct_name
      raise NotImplementedError, 'You must implement the correct_name method'
    end
  end
  