#!/usr/bin/env ruby

require './book'
require './student'
require './teacher'
require './rental'

class App
  attr_reader :books, :people
  attr_accessor :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # Show list of option to the user
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

  # Method for run by selection of user
  def user_select
    selection = gets.chomp
    if selection === '1'
      puts
      list_books
      run
    elsif selection === '2'
      puts
      list_people
      run
    elsif selection === '3'
      puts
      create_person
      run
    elsif selection === '4'
      puts
      create_book
      run
    elsif selection === '5'
      puts
      create_rental
      run
    elsif selection === '6'
      puts
      list_rental
      run
    elsif selection === '7'
      abort
    else
      puts
      puts 'Please Select a correct number'
      puts
      run
    end
  end

  # Method to create a book and push into the array
  def create_book
    print 'Book Title: '
    titulo = gets.chomp
    print 'Author Name: '
    autor = gets.chomp
    book = Book.new(titulo, autor)
    @books.push(book)
    puts
    puts 'Book created successfully'
    puts
  end

  # Method to create student or teacher and push into the people array
  def create_person
    print 'Do you want to create a student (1) or a Teacher (2)? [Input the number]: '
    selection = gets.chomp
    puts
    if selection === '1'
      print 'Student Classroom: '
      classroom = gets.chomp
      print 'Student age: '
      age = gets.chomp
      print 'Student Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      if permission === 'y' || permission === 'Y'
        student = Student.new(classroom, age, name, parent_permission: true)
        @people.push(student)
      elsif permission === 'n' || permission === 'N'
        student = Student.new(classroom, age, name, parent_permission: false)
        @people.push(student)
      else
        puts 'Wrong selection on parent permission please try add again'
      end
      puts
      puts 'Student added successfully'
    elsif selection === '2'
      print 'Teacher Specialization: '
      specialization = gets.chomp
      print 'Teacher age: '
      age = gets.chomp
      print 'Teacher Name: '
      name = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      @people.push(teacher)
      puts
      puts 'Teacher added successfully'
    else
      puts 'Wrong input selection please try again'
    end
    puts
  end

  # Method to create rental and push into the rentals array
  def create_rental
    puts 'Select a book from the following list by number'
    puts
    books.each_with_index do |book, idx|
      puts "#{idx}) Title: #{book.title}  Author: #{book.author}"
    end
    selection_book = books[gets.chomp.to_i]
    puts
    puts 'Select a person from the following list by number (not id)'
    puts
    people.each_with_index do |people, idx|
      if people.class.name === 'Student'
        puts "#{idx}) [Student] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
      else
        puts "#{idx}) [Teacher] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
      end
    end
    selection_person = people[gets.chomp.to_i]
    puts
    print 'Please write the date: '
    selection_date = gets.chomp
    rental = Rental.new(selection_date, selection_person, selection_book)
    @rentals.push(rental)
    puts
    puts 'Rental created successfully'
    puts
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
      if people.class.name === 'Student'
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
    puts
    puts 'Rentals:'
    rentals.each do |rental|
      if rental.person.id === select_id.to_i
        puts "Name: #{rental.person.name} Book: #{rental.book.title} Date: #{rental.date}"
      end
    end
    puts
  end
end

def main
  app = App.new
  app.run
end

main
