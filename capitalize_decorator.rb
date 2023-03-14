require_relative('./base_decorator.rb')
require_relative('./person.rb')

class CapitalizeDecorator < BaseDecorator
		def correct_name
			@nameable.correct_name.capitalize
		end
end