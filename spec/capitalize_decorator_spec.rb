require_relative '../person'
require_relative '../nameable'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  context 'When testing the CapitalizeDecorator class' do
    it "CapitalizeDecorator capitalize the first litter in person's name" do
      person = Person.new(16, 'mark', parent_permission: false)
      base = BaseDecorator.new(person)
      expect(base.correct_name.capitalize).to eq 'Mark'
    end
  end
end
