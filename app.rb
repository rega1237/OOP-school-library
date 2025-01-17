require './book'
require './student'
require './teacher'
require './rental'
require 'json'

class App
  attr_reader :books, :people
  attr_accessor :rentals

  def initialize
    @books = File.exist?('./data/books.json') ? JSON.parse(File.read('./data/books.json'), create_additions: true) : []
    @people = if File.exist?('./data/people.json')
                JSON.parse(File.read('./data/people.json'),
                           create_additions: true)
              else
                []
              end
    @rentals = File.exist?('./data/rentals.json') ? handle_rentals : []
  end

  # Method to create a book and push into the array
  def create_book
    print 'Book Title: '
    titulo = gets.chomp
    print 'Author Name: '
    autor = gets.chomp
    book = Book.new(titulo, autor)
    @books.push(book)
    puts 'Book created successfully'
    puts
  end

  # Method to create student or teacher and push into the people array
  def create_person
    print 'Do you want to create a student (1) or a Teacher (2)? [Input the number]: '
    selection = gets.chomp
    case selection
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Wrong input selection please try again'
    end
    puts
  end

  # Method to create rental and push into the rentals array
  def create_rental
    puts 'Select a book from the following list by number'
    books_to_select
    selection_book = books[gets.chomp.to_i]
    puts 'Select a person from the following list by number (not id)'
    people_to_select
    selection_person = people[gets.chomp.to_i]
    print 'Please write the date: '
    selection_date = gets.chomp
    rental = Rental.new(selection_date, selection_person, selection_book)
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  # Show all books
  def list_books
    books.each do |book|
      puts "Title: #{book.title}  Author: #{book.author}"
    end
    puts
  end

  # Show all students and teachers
  def list_people
    people.each do |people|
      case people.class.name
      when 'Student'
        puts "[Student] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
      else
        puts "[Teacher] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
      end
    end
    puts
  end

  def list_rental
    print 'ID of person: '
    select_id = gets.chomp
    puts 'Rentals:'
    rentals.each do |rental|
      case rental.person.id
      when select_id.to_i
        puts "Name: #{rental.person.name} Book: #{rental.book.title} Date: #{rental.date}"
      end
    end
    puts
  end

  # Helpful Methods to reduce code

  def books_to_select
    books.each_with_index do |book, idx|
      puts "#{idx}) Title: #{book.title}  Author: #{book.author}"
    end
  end

  def people_to_select
    people.each_with_index do |people, idx|
      case people.class.name
      when 'Student'
        puts "#{idx}) [Student] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
      else
        puts "#{idx}) [Teacher] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
      end
    end
  end

  def create_student
    print 'Student Classroom: '
    classroom = gets.chomp
    print 'Student age: '
    age = gets.chomp
    print 'Student Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    case permission
    when 'y' || 'Y'
      student = Student.new(classroom, age, name, parent_permission: true)
      @people.push(student)
    when 'n' || 'N'
      student = Student.new(classroom, age, name, parent_permission: false)
      @people.push(student)
    else
      puts 'Wrong selection on parent permission please try add again'
    end
    puts 'Student added successfully'
  end

  def create_teacher
    print 'Teacher Specialization: '
    specialization = gets.chomp
    print 'Teacher age: '
    age = gets.chomp
    print 'Teacher Name: '
    name = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Teacher added successfully'
  end

  def save_data
    File.write('./data/books.json', JSON.pretty_generate(@books))
    File.write('./data/people.json', JSON.pretty_generate(@people))
    File.write('./data/rentals.json', JSON.pretty_generate(@rentals))
  end

  private

  def handle_rentals
    new_rentals = []
    rental_convert = JSON.parse(File.read('./data/rentals.json'), create_additions: true)
    rental_convert.each do |rental|
      filter_people = @people.filter { |person| person.id == rental[:person_id] }
      filter_book = @books.filter { |book| book.title == rental[:book_title] }
      new_rental = Rental.new(rental[:date], filter_people[0], filter_book[0])
      new_rentals << new_rental
    end
    new_rentals
  end
end
