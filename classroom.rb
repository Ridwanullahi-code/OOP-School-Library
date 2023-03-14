require_relative './student'

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    # saving each student object in an array
    @students << student
    student.classroom = self
  end
end

s = Student.new('Micheal', '30', 'LT2')
puts s
