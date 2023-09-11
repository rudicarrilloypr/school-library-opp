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
require_relative 'book_factory'
require_relative 'rental_factory'
require_relative 'person_factory'

# This class represents a Teacher with attributes like id, name, and age.
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def create_person
    person = PersonFactory.create_person
    return unless person
    
    @people << person
    puts "#{person.class} created successfully"
  end
  
  def create_book
    book = BookFactory.create_book
    @books << book
    puts 'Book created successfully'
  end
  
  def create_rental
    rental = RentalFactory.create_rental(@books, @people)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each { |rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" }
  end
end
