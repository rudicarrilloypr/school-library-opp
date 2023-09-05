# frozen_string_literal: true

require_relative 'nameable'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'bookclass'
require_relative 'rental'

person1 = Person.new(15, 'John')
puts person1.id
puts person1.name
puts person1.age
puts person1.can_use_services?

# Test for Classroom and Student relationship
classroom = Classroom.new('10th Grade')
puts classroom.label

student1 = Student.new(19, classroom, 'Jane')
puts student1.classroom.label

# Now test for Student
puts student1.name
puts student1.age
puts student1.can_use_services?
puts student1.play_hooky

# Test for Teacher class
teacher1 = Teacher.new(40, 'Mathematics', 'Mr. Smith')
puts teacher1.name
puts teacher1.age
puts teacher1.can_use_services?

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

# Test for Classroom and Student relationship
classroom = Classroom.new('10th Grade')
puts classroom.label

student1 = Student.new(19, classroom, 'Jane')
puts student1.classroom.label

# Test for Book
book1 = Book.new('1984', 'George Orwell')
puts book1.title

# Test for Rental and relationships
rental1 = Rental.new('2022-09-04', book1, student1)
puts rental1.date

# Verify the many-to-many relationship
puts student1.rentals.first.date
puts book1.rentals.first.date
