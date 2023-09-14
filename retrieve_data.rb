require_relative 'app'
require 'json'
require_relative 'rental'

class RetrieveData
  def initialize(app)
    @app = app
  end

  def retrieve
    app_arrays = %w[persons books rentals]
    app_arrays.each do |file|
      next unless File.exist?("storage/#{file}.json")

      data = JSON.parse(File.read("storage/#{file}.json"))
      data.each do |data_items|
        case file
        when 'persons'
          select_person?(data_items['type'], data_items)
        when 'books'
          @app.create_a_book(data_items['title'], data_items['author'])
        when 'rentals'
          load_rentals(data_items)
        end
      end
    end
  end

  def load_rentals(details)
    rent_person = if details['person']['type'] == 'Student'
                    Student.new(name: details['person']['name'], age: details['person']['age'],
                                parent_permission: details['person']['parent_permission'])
                  else
                    Teacher.new(name: details['person']['name'], age: details['person']['age'],
                                specialization: details['person']['specialization'])
                  end

    rent_book = Book.new(details['book']['title'], details['book']['author'])

    rent_date = details['date']

    # @app.create_a_rental(rent_date, rent_book, rent_person)
    rental = Rental.new(rent_date, rent_book, rent_person)
    @app.rentals << rental
  end

  def select_person?(person_type, details)
    case person_type
    when 'Student'
      @app.create_student(details['age'], details['name'])
    when 'Teacher'
      @app.create_teacher(details['age'], details['specialization'], details['name'])
    end
  end
end
