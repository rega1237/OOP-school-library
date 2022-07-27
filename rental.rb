class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'person' => @person.id,
      'book' => @book.title,
    }.to_json(*args)
  end

  def self.json_create(rental)
    {
      date: rental['date'],
      person_id: rental['person'],
      book_title: rental['book']
    }
  end
end
