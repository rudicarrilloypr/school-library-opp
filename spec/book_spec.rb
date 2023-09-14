require_relative '../bookclass'

RSpec.describe Book do
  describe Book do
    let(:book) { Book.new('Title 1', 'Author 1') }

    describe '#initialize' do
      it 'creates a book with title and author' do
        expect(book.title).to eq('Title 1')
        expect(book.author).to eq('Author 1')
      end

      it 'has an id' do
        expect(book.id).not_to be_nil
      end

      it 'initializes rentals as an empty array' do
        expect(book.rentals).to be_empty
      end
    end

    describe '#to_h' do
      it 'returns a hash representation of the book' do
        expected_hash = {
          id: book.id,
          title: 'Title 1',
          author: 'Author 1',
          rentals: []
        }
        expect(book.to_h).to eq(expected_hash)
      end
    end
  end
end
