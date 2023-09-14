require_relative 'nameable'
<<<<<<< HEAD
# This class represents a Person with attributes like id, name, and age.
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id
=======
>>>>>>> a4b50254b8b8d4ffd0d641c2b524332f5386095b

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(name:, age:, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

<<<<<<< HEAD
  def to_h
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals.map(&:to_h)
=======
  private

  def of_age?
    @age && @age >= 18
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name,
      'age' => @age
>>>>>>> a4b50254b8b8d4ffd0d641c2b524332f5386095b
    }
  end

  private

  def of_age?
    @age >= 18
  end
end
