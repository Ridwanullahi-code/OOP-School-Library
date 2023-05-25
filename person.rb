require_relative('./nameable')
# person class store person information and properties
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def display_info
    { 'id' => @id, 'name' => @name, 'age' => @age }
  end

  def update_info(name, age)
    @name = name
    @age = age
  end

  def can_use_services
    if of_age || @parent_permission
      true
    elsif !of_age || !@parent_permission
      false
    end
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age
    @age.to_i >= 18
  end

  def generate_id
    rand(1..100)
  end
end
