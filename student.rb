require_relative('./person')
require_relative('./classroom')
# student class store student information and properties
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hook
    '¯(ツ)/¯'
  end

  def add_classroom
    @classroom.add_students(self)
  end
end
