class RentalFactory
    def self.create_rental(books, people)
      puts 'Select a book from the following list by number'
      books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  
      book_index = gets.chomp.to_i
  
      puts 'Select a person from the following list by number'
      people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
  
      person_index = gets.chomp.to_i
  
      print 'Date: '
      date = gets.chomp
  
      Rental.new(date, books[book_index], people[person_index])
    end
  end
  