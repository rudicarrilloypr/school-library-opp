require_relative 'person'

class Teacher < Person
  def initialize(name:, age:, specialization:)
    super(name: name, age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      'id' => @id,
      'type' => self.class.name,
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization,
      'parent_permission' => @parent_permission,
      'rentals' => @rentals.map { |rental| { 'date' => rental.date } }
    }
  end
end
