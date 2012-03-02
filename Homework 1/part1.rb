def palindrome?(input)
	input.gsub(/\W/,'').downcase == input.gsub(/\W/,'').downcase.reverse
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")