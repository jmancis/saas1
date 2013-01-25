#solo pasa el 85% de los tests

def combine_anagrams(words)
  if words.length==0 
		return []
	end
  anagrams=[]
   words.each do |word|
	found = false
      anagrams.each do |group|
	if areAnagram(group[0],word) 
		found=true
		if !group.include?(word)
			group<<word
		end
		#break 2
	end
	
      end
	if !found 
		anagrams<<[word]
	end
    end
return anagrams
end

def areAnagram(word1,word2)
 return  word1.downcase.chars.sort==word2.downcase.chars.sort
end

#a=combine_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] )
