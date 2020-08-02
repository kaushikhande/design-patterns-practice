class Creator
  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented '#{__method__}'"
  end

  def some_operation
    product = factory_method

    result = "Creator: The same creator method works with #{product.operation}"
  end
end

class ConcreteCreator1 < Creator
  def factory_method
    ConcreteProduct1.new
  end
end

class ConcreteCreator2 < Creator
  def factory_method
    ConcreteProduct2.new
  end
end

class Product
  def operation
    raise NotImplementedError, "#{self.class} has not implemented '#{__method__}'"
  end
end

class ConcreteProduct1 < Product
  def operation
    'Result of the ConcreteProduct1'
  end
end

class ConcreteProduct2 < Product
  def operation
    'Result of the ConcreteProduct2'
  end
end

def client_code(creator)
  print "Client: I m not aware of the creators class, but it still works.\n"\
        "#{creator.some_operation}"
end

puts 'App launched with ConcreteCreator1.'
client_code(ConcreteCreator1.new)
puts "\n\n"

puts 'App launched with ConcreteCreator2.'
client_code(ConcreteCreator2.new)
puts "\n\n"
