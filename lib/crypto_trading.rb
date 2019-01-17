require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def cryptozer
	crypto = []
	price = []
	trading_hash = []
	test1 = []

	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('//*/td[2]/a').each do |node|
	  crypto << node.text
	end

	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('//*/td[5]/a').each do |node2|
	  price << node2.text.delete("$")#.to_f
	end

number_of_hash = crypto.size

trading_hash = crypto.zip(price)

trading_hash.each { |record2, record| test1 << { record2[0..number_of_hash] => record[0..number_of_hash] } }

puts test1
return test1

end

cryptozer