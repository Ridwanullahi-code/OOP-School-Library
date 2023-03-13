# frozen_string_literal: true

require_relative('./person')
# student class store student information and properties
class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    @classroom = classroom
    super(age, name, parent_permission: true)
  end

  def play_hook
    "¯\(ツ)/¯"
  end
end
