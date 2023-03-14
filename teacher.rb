require_relative('./person')
# class to store teacher information and methods
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization, parent_permission: false)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services
    (of_age || !of_age) || (@parent_permission || !@parent_permission)
  end
end
