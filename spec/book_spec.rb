require_relative '../book'

RSpec.describe Book do
  describe '#initialize' do
    it 'creates a new book object with default values if no arguments are provided' do
      book = Book.new

      expect(book).to be_a(Book)
      expect(book.id).to be >= 100 && be <= 10_000
      expect(book.title).to eq('no title')
      expect(book.author).to eq('no author')
      expect(book.rentals).to be_empty
    end

    it 'creates a new book object with provided arguments' do
      book = Book.new(123, 'The Great Gatsby', 'F. Scott Fitzgerald')

      expect(book.id).to eq(123)
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
      expect(book.rentals).to be_empty
    end
  end
end
