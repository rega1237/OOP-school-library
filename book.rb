class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(data)
    new(data['title'], data['author'])
  end
end
