require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Test for Person class
person1 = Person.new(15, "John")
puts person1.id
puts person1.name
puts person1.age
puts person1.can_use_services? # This should return true because age is less than 18 but has parent permission by default.

# Test for Student class
student1 = Student.new(19, "10th Grade", "Jane")
puts student1.name
puts student1.age
puts student1.can_use_services? # This should return true because age is more than 18.
puts student1.play_hooky # This should return "¯\(ツ)/¯".

# Test for Teacher class
teacher1 = Teacher.new(40, "Mathematics", "Mr. Smith")
puts teacher1.name
puts teacher1.age
puts teacher1.can_use_services? # This should always return true for a teacher.
