#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  str=str.downcase.gsub(/\W/, '')
	str == str.reverse
end

def count_words(str)
	words={}
	str.split(/[^a-zA-Z]/).each do |word|
		word.downcase!
		words[word] ? words[word] += 1 : words[word] = 1
	end
	words
end


