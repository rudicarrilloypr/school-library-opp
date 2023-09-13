require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  describe Rental do
    let(:book) { Book.new('Book 1', 'Author 1') }
    let(:person) { Person.new(20, 'John Doe') }
    let(:rental) { Rental.new('2023-09-15', book, person) }

    describe '#initialize' do
      it 'creates a rental with date, associated book, and person' do
        expect(rental.date).to eq('2023-09-15')
        expect(rental.book).to eq(book)
        expect(rental.person).to eq(person)
      end

      it 'adds itself to the book and person rentals list' do
        expect(book.rentals).to include(rental)
        expect(person.rentals).to include(rental)
      end
    end

    describe '#to_h' do
      it 'returns a hash representation of the rental' do
        expected_hash = {
          date: '2023-09-15',
          book_id: book.id,
          person_id: person.id
        }
        expect(rental.to_h).to eq(expected_hash)
      end
    end
  end
end
