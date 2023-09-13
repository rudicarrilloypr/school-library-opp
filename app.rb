require 'json'
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
    @people = load_data_from_file('people.json') || []
    @books = load_data_from_file('books.json') || []
    @rentals = load_data_from_file('rentals.json', @books, @people) || []
  end

  def save_data_to_file(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end

  def load_data_from_file(filename, books = [], people = [])
    return [] unless File.exist?(filename)

    json_data = File.read(filename)
    return [] if json_data.strip.empty?

    parsed_data = JSON.parse(json_data)

    case filename
    when 'people.json'
      parsed_data.map do |person_hash|
        if person_hash.key?('specialization')
          Teacher.new(person_hash['age'], person_hash['specialization'], person_hash['name'])
        elsif person_hash.key?('classroom')
          classroom = Classroom.new(person_hash['classroom'])
          Student.new(person_hash['age'], classroom, person_hash['name'])
        else
          Person.new(person_hash['age'], person_hash['name'])
        end
      end
    when 'books.json'
      parsed_data.map { |book_hash| Book.new(book_hash['title'], book_hash['author']) }
    when 'rentals.json'
      parsed_data.map do |rental_hash|
        book = books.find { |b| b.id == rental_hash['book_id'] }
        person = people.find { |p| p.id == rental_hash['person_id'] }
        Rental.new(rental_hash['date'], book, person)
      end
    else
      []
    end
  end

  def save_all_data
    save_data_to_file('people.json', @people.map(&:to_h))
    save_data_to_file('books.json', @books.map(&:to_h))
    save_data_to_file('rentals.json', @rentals.map(&:to_h))
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

  def close
    save_all_data
  end
end
