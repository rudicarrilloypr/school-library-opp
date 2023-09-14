# This class represents a Student with attributes like id, name, and age.

class Student < Person
  attr_accessor :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_h
    super.merge({ classroom: @classroom.label })
  end
end
