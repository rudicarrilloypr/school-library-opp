require_relative 'person'

class Student < Person
  attr_accessor :classroom

<<<<<<< HEAD
  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
=======
  def initialize(name:, age:, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = nil
>>>>>>> a4b50254b8b8d4ffd0d641c2b524332f5386095b
  end

  def play_hooky
    '¯(ツ)/¯'
  end

<<<<<<< HEAD
  def to_h
    super.merge({ classroom: @classroom.label })
=======
  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_hash
    {
      'id' => @id,
      'type' => self.class.name,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'rentals' => @rentals.map { |rental| { 'date' => rental.date } }
    }
>>>>>>> a4b50254b8b8d4ffd0d641c2b524332f5386095b
  end
end
