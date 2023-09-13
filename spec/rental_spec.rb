require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  describe '#initialize' do
    it 'creates a new rental object with provided date, book, and person' do
      book = Book.new
      person = Person.new(name: 'Alice', age: 25)
      date = '2023-08-09'
      rental = Rental.new(date, book, person)

      expect(rental).to be_a(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
