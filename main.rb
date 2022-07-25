require './app'

class Main
  attr_reader :app

  def initialize
    @app = App.new
  end

  def run
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 = Exit'
    user_select
  end
end

main = Main.new()
main.run
