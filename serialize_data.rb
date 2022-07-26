require 'json'

class SerializeData

  def book_to_json(book)
    JSON.dump ({
      :title => book.title,
      :author => book.author
    })
  end
end
