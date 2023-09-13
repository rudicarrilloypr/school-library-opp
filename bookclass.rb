# This class represents a Book with a title and author.
class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author)
    @id = rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def to_h
    {
      id: @id,
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_h)
    }
  end
end
