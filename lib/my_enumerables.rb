module Enumerable
  # Your code goes here
  def my_all
    self.my_each do |element|
      if element == yield(element)
        return true
      else
        return false
      end
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0..self.length-1
      yield (self[i])
    end
    self
  end
end

a = [2,2,2,2,2]
p a.my_all { |n| n < 2}