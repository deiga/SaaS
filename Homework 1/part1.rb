def palindrome?(input)
	input.gsub(/\W/,'').downcase == input.gsub(/\W/,'').downcase.reverse
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")

def count_words(string)
	count_hash = {}
	string.downcase.scan(/\w+/).each { |x| count_hash[x] += 1 }
	count_hash
end

puts count_words("A man, a plan, a canal -- Panama")
puts count_words("Doo dee doo bee doo")