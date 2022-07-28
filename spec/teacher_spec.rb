require_relative '../teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'The initialized correctly' do
      teacher = Teacher.new('Doctor', 55, 'Leonardo')
      expect(teacher.specialization).to eq 'Doctor'
      expect(teacher.age).to eq 55
      expect(teacher.name).to eq 'Leonardo'
    end

    it 'Teacher can use_services' do
      teacher = Teacher.new('Doctor', 55, 'Leonardo')
      expect(teacher.can_use_services?).to eq true
    end

    it 'Teacher has a id' do
      teacher = Teacher.new('Doctor', 55, 'Leonardo')
      expect(teacher.id).to be_truthy
    end
  end
end
