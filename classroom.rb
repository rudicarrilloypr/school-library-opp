# This class represents a Classroom with a label attribute.
class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end

  def to_h
    {
      label: @label,
      student_ids: @students.map(&:id)
    }
  end
end
