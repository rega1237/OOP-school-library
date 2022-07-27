require './person'

class Student < Person
  attr_accessor :classroom, :id

  def initialize(classroom, age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def student_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'classroom' => classroom,
      'age' => age,
      'name' => name,
      'parent_permission' => @parent_permission,
      'id' => id,
      'rentals' => rentals
    }.to_json(*args)
  end

  def self.json_create(student)
    std = new(student['classroom'], student['age'], student['name'])
    std.id = student['id']
    std
  end
end
