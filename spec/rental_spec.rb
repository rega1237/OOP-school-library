require_relative '../rental'
require_relative '../student'

describe Rental do
  context 'When testing the Rental class' do
    it 'The initialized correctly' do
      student = Student.new('c12', 19, 'Mark', parent_permission: true)
      book = Book.new('Book Title', 'Book author')
      rental = Rental.new('27/07/2022', student, book)
      expect(rental.date).to eq '27/07/2022'
      expect(rental.book).to be_instance_of(Book)
      expect(rental.person).to be_instance_of(Student)
    end

    it 'rental should be added to a person' do
      student = Student.new('c12', 19, 'Mark', parent_permission: true)
      book = Book.new('Book Title', 'Book author')
      rental = Rental.new('27/07/2022', student, book)
      expect(rental.person.rentals.length).to eq 1
    end

    it 'rental should be added to a book' do
      student = Student.new('c12', 19, 'Mark', parent_permission: true)
      book = Book.new('Book Title', 'Book author')
      rental = Rental.new('27/07/2022', student, book)
      expect(rental.book.rentals.length).to eq 1
    end
  end
end
