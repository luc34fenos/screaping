require 'rubygems'
require 'nokogiri'
require 'open-uri'

lien = 'http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'

doc = Nokogiri::HTML(open(lien))

i = 0
arr = []
arr_2 = []
doc.css('div#deputes-list li a').each{|y| 
	arr[i] = y.text 
	puts lien_2 = lien.slice(0..33) + y['href']
	page = Nokogiri::HTML(open(lien_2))
	j = 0
	page.css('dl[class = deputes-liste-attributs] dd ul li a').each{|x| 
		puts x.text unless (x.text =~ /'&Eacutecrire'/) == nil
		j += 1
	}
	i += 1
} 

hash = arr.zip(arr_2).to_h

puts hash.to_s