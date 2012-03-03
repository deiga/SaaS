class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s
		attr_reader attr_name
		attr_reader attr_name+"_history"
		class_eval %Q{
			def #{attr_name}=(new_attr)
				@#{attr_name}_history ||= Array.new << @#{attr_name}
				@#{attr_name}_history << new_attr
				@#{attr_name} = new_attr
			end
		}
	end
end

class Foo
	attr_accessor_with_history :bar
end
