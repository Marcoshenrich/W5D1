# class Integer
#   # Integer#hash already implemented for you
# end

# # 9.to_s(2) #=> "1001"
# # while the reverse is obtained with String#to_i(base):
# # "1001".to_i(2) #=> 9



# class Array
#   def hash
#     # does not work if el is array
#     alphabet = ("a".."z").to_a
#     bit_array = []
#     bit_position = 0
    
#     proc_array = []
#     proc_array << Proc.new { |num1, num2| (num1 & num2).to_s(2) }
#     proc_array << Proc.new { |num1, num2| (num1 | num2).to_s(2) }
#     proc_array << Proc.new { |num1, num2| (num1 ^ num2).to_s(2) }
#     proc_array << Proc.new { |num1, num2| (num1 << num2).to_s(2) }
#     proc_array << Proc.new { |num1, num2| (num1 >> num2).to_s(2) }
#     proc_position = 0

#     self.each do |el|
#       if el.is_a?(String)
#         bit_int_value = 0
#         el.each_char { |char| bit_int_value += alphabet.index(char) }
#         bit_array << bit_int_value.to_s(2)
#       else 
#         bit_array << el.to_s(2)
#       end
#     end

#     (0..7).each do |i|

      
      

        
#   end
# end

# class String
#   def hash
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
    
#   end
# end


# 47 thru 122
# nums, lowercase, uppercase

# hash with length 8

# hash[0] -> iterate through the bitmap, consolidate into integer, and call.chr on it
# hash[1] + 30 -> iterate through the bitmap, consolidate into integer, ensure it is within range, and call.chr on it