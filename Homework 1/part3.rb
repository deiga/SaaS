def combine_anagrams(words)
	anagrams = Hash.new
	words.each do |word|
		anagram_key = word.downcase.chars.sort.join
		anagrams[anagram_key] ||= Array.new
		anagrams[anagram_key] << word
	end
	anagrams.values
end

puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']).inspect