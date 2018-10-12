#! /usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'
#require 'resetclient'

lien = 'http://annuaire-des-mairies.com/val-d-oise.html'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open(lien))

def get_the_email_of_a_townhal_from_its_webpage(page , lien, n_ville)
	v_lien = ""
	page.css('a[class = lientxt]').each{|y| v_lien = lien.slice(0..30) + y['href'].slice(1..(y['href'].to_s.length)) if y.text == n_ville}
	page_2 = Nokogiri::HTML(open(v_lien))
 	page_2.css('td')[7].text
end

def get_all_the_urls_of_val_doise_townhalls(page, lien)
 i = 0
 n_VILLE = []
 hash = {}
 page.css('a[class = lientxt]').each{|x| 
 	hash[x.text] = get_the_email_of_a_townhal_from_its_webpage(page, lien, x.text.to_s)
 	 }
 	 return hash
end

puts "### Search for nodes by css"
#get_the_email_of_a_townhal_from_its_webpage(doc, lien, "VAUREAL")

puts get_all_the_urls_of_val_doise_townhalls(doc, lien)