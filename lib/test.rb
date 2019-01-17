require 'rubygems'
require 'nokogiri'   
require 'open-uri'


page = Nokogiri::HTML(open("https://www.pretto.fr/"))   
puts page.css("title")[0].name
puts page.css("title")[0].text

page = Nokogiri::HTML(open("https://www.pretto.fr/"))
links = page.css("a")
puts links.length
puts links[0].text
puts links[0]["href"]

page = Nokogiri::HTML(open("https://www.pretto.fr/"))
news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }
puts news_links.class

doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
	doc.xpath('//h3[@class = "r"]/a[@class = "l"]').each do |node|
	  puts node.text
	end