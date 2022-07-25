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

# rubocop:disable Metrics/MethodLength
def user_select # rubocop:disable Metrics/CyclomaticComplexity
  selection = gets.chomp
  case selection
  when '1'
    app.list_books
    run
  when '2'
    app.list_people
    run
  when '3'
    app.create_person
    run
  when '4'
    app.create_book
    run
  when '5'
    app.create_rental
    run
  when '6'
    app.list_rental
    run
  when '7'
    abort
  else
    puts 'Please Select a correct number'
  end
end
# rubocop:enable Metrics/MethodLength

main = Main.new
main.run
