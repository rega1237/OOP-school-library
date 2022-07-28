require_relative '../student'

describe Student do
  context 'When testing the Student class' do
    it 'The initialized correctly' do
      student = Student.new('c12', 16, 'Mark', parent_permission: false)
      expect(student.classroom).to eq 'c12'
      expect(student.age).to eq 16
      expect(student.name).to eq 'Mark'
      expect(student.parent_permission).to eq false
    end

    it "Student should't use_services" do
      student = Student.new('c12', 16, 'Mark', parent_permission: false)
      expect(student.can_use_services?).to eq false
    end

    it 'Student should use_services' do
      student = Student.new('c12', 16, 'Mark', parent_permission: true)
      expect(student.can_use_services?).to eq true
    end
  end
end
