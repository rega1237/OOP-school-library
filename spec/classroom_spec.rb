require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'When testing the Classroom class' do
    it 'The initialized correctly' do
      classroom = Classroom.new('c12')
      expect(classroom.label).to eq 'c12'
      expect(classroom.students).to eq []
    end

    it 'a student added to the classroom' do
      classroom = Classroom.new('c12')
      student = Student.new('c12', 16, 'Mark', parent_permission: false)
      classroom.add_student(student)
      expect(classroom.students.length).to equal 1
    end
  end
end
