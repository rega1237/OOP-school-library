require_relative '../person'

describe Person do
  context 'When testing the Person class' do
    it 'The initialized correctly' do
      person = Person.new(18, 'Messi')
      expect(person.age).to eq 18
      expect(person.name).to eq 'Messi'
      expect(person.parent_permission).to eq true
    end

    it "person should't use_services" do
      person = Person.new(16, 'Mark', parent_permission: false)
      expect(person.can_use_services?).to eq false
    end

    it 'person should use_services' do
      person = Person.new(19, 'Mark', parent_permission: false)
      expect(person.can_use_services?).to eq true
    end

    it 'person has a id' do
      person = Person.new(19, 'Mark', parent_permission: false)
      expect(person.id).to be_truthy
    end
  end
end
