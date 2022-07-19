class Person
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
