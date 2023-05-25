require_relative('./book')
require_relative('./person')
require_relative('./student')

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end
end
