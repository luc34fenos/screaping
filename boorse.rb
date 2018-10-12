require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all'))

i = 0
arr = []
arr_2 = []
doc.css('a.price').each{|x| 
	arr[i] = x.text
	i += 1
	}

j= 0
doc.css('tr td a[class = currency-name-container\ link-secondary]'){|y|
	arr_2[j] = y.text
	j += 1
} 

hash = arr_2.zip(arr).to_h

puts hash.to_s