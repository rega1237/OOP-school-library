require_relative '../trimmer_decorator'
require_relative '../person'
require_relative '../base_decorator'

describe TrimmerDecorator do
  context 'When testing the TrimmerDecorator class' do
    it 'TrimmerDecorator cut the string after ten characthers' do
      person = Person.new(16, 'The Maximiliam Falcon', parent_permission: false)
      decorator = TrimmerDecorator.new(person)
      expect(decorator.correct_name.length).to eq 10
    end
  end
end
