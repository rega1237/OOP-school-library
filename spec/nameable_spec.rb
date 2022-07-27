require_relative '../person'
require_relative '../nameable'

describe Nameable do
  context 'When testing the Nameable class' do
    it 'person should implement Nameable' do
      person = Person.new(16, 'Mark', parent_permission: false)
      expect(person.correct_name).to eq 'Mark'
    end
  end
end
