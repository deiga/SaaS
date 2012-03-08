# metaprogramming to the rescue!

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      @currency = singular_currency
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(new_currency)
  	singular_currency = new_currency.to_s.gsub( /s$/, '')
  	if @@currencies.has_key?(singular_currency)
        @currency = singular_currency
        self * @@currencies[singular_currency]
    end
  end
end

puts 5.dollars.in(:euros)
puts 5.dollars.in(:rupees)
puts 5.dollars.in(:yen)
puts 5.euro.in(:dollar)
puts 5.euro.in(:yen)
puts 5.euro


class String
  def palindrome?()
    self.gsub(/\W/,'').downcase == self.gsub(/\W/,'').downcase.reverse
  end
end


puts "A man, a plan, a canal -- Panama".palindrome?
puts "Madam, I'm Adam!".palindrome?
puts "Abracadabra".palindrome?
