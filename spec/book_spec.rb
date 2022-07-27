require_relative '../book'

describe Book do
  context 'When testing the Book class' do
    it 'The initialized correctly' do
      book = Book.new('Book Title', 'Book author')
      expect(book.title).to eq 'Book Title'
      expect(book.author).to eq 'Book author'
    end

    it 'should has an array for rentals' do
      book = Book.new('Book Title', 'Book author')
      expect(book.rentals).to eq []
    end
  end
end
