module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |element|
      return true unless block_given?
      return false unless yield(element) == true
    end
    true
  end
  def my_any?
    self.my_each do |element|
    return true unless yield(element) == false
    end
    false
  end
  def my_count
    return self.size unless block_given?
    count = 0
    self.my_each do |element|
      count += 1 if yield(element)
    end
    return count
  end
  def my_each_with_index
    return self unless block_given?
    index = 0
    self.each do |element|
      yield(element,index)
      index += 1
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

a = [1,2,3,4,5]

p a.my_each_with_index { |element, index| puts "here is element #{element} and here is index #{index}"}