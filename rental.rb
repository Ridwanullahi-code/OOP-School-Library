require_relative('./book')
require_relative('./person')

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, _book, _person)
    @date = date
    @book.rental << self
    @person.rentals << self
  end
end