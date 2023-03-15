require_relative('./person')
require_relative('./book')
require_relative('./student')
require_relative('./teacher')
require_relative('./rental')

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def all_books
    if @books.empty?
      puts 'No books in the library yet'
    else
      @books.each do |book|
        puts "Title: #{book.title} Author: #{book.author}"
      end
    end
  end

  def all_people
    if @people.empty?
      puts 'No people in the library yet'
    else
      @people.each do |person|
        puts "class: #{person.class} ID: #{person.id} Name: #{person.name} Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2)? [input number]: '
    type = gets.chomp.to_i
    case type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student
    print('Enter Student Age: ')
    age = gets.chomp.to_i
    print('Enter Student Name: ')
    name = gets.chomp
    print('Has parent permission? [Y/N]')
    permission = gets.chomp.to_s.downcase == 'y'
    @people << Student.new(age, name, parent_permission: permission)
    puts 'Person created successfully'
  end

  def create_teacher
    print('Enter Teacher Age: ')
    age = gets.chomp.to_i
    print('Enter Teacher Name: ')
    name = gets.chomp
    print 'Enter Teacher Specialization: '
    special = gets.chomp
    @people << Teacher.new(age, name, specialization: special)
    puts 'Person created successfully'
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter author of the book: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    if @books.empty? || @people.empty?
      puts "\e[31mNo books or people in the library yet.\e[0m"
      return
    end
    book = select_book
    person = select_person
    if person && book
      print 'Date: '
      date = gets.chomp.to_s
      @rentals << Rental.new(date, book, person)
      puts 'Rental created successfully.'
    else
      puts "\e[31mInvalid person or book selected. Please try again.\e[0m"
    end
  end

  def select_book
    puts 'Select a book from the following list by number '
    @books.each_with_index do |book, index|
      puts "\e[34m#{index + 1}. Title: \"#{book.title}\", Author: #{book.author} \e[0m"
    end
    book_idx = gets.chomp.to_i - 1
    @books[book_idx]
  end

  def select_person
    puts 'Select a person from the following list by number (not id) '
    @people.each_with_index do |person, index|
      puts "\e[34m#{index + 1}. [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} \e[0m"
    end
    person_idx = gets.chomp.to_i - 1
    @people[person_idx]
  end

  def all_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i
    rentals = @rentals.select { |r| r.person.id.to_i == person_id }
    if rentals.empty?
      puts "\e[31mNo rentals found for this person. Please try again.\e[0m"
    else
      puts 'Rentals: '
      rentals.each do |rental|
        puts "\e[34mDate: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}\e[0m"
      end
    end
  end
end
