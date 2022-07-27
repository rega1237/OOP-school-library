require './person'

class Teacher < Person
  attr_accessor :id

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_reader :specialization

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'specialization' => specialization,
      'age' => age,
      'name' => name,
      'parent_permission' => @parent_permission,
      'id' => id
    }.to_json(*args)
  end

  def self.json_create(teacher)
    teach = new(teacher['specialization'], teacher['age'], teacher['name'])
    teach.id = teacher['id']
    teach
  end
end
