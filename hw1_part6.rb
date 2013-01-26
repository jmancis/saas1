class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019,'dollar'=>1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(currency)
   singular_currency = currency.to_s.gsub( /s$/, '')
	self / @@currencies[singular_currency]
  end
end

class String
  def palindrome?
	str=self.downcase.gsub(/\W/, '')
	str == str.reverse
  end
end

module Enumerable
  def palindrome?
	self.to_a==self.reverse_each().to_a
  end
end
