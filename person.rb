require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals, :date
  attr_accessor :name, :age

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private :of_age?
end
