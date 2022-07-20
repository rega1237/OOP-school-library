require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
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

  private :of_age?
end
