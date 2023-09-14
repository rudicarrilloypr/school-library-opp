class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_hash
    {
      'date' => @date,
      'book_id' => @book.id,
      'person_id' => @person.id
    }
  end
end
