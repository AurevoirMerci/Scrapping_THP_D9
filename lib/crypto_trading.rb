require 'rubygems'
require 'nokogiri'   
require 'open-uri'

crypto = []
price = []
trading_hash = []

doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('//*/td[2]/a').each do |node|
	  crypto << node.text
	end

doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('//*/td[5]/a').each do |node|
	  price << node.text
	end

trading_hash = crypto.zip(price).to_h

trading_hash.transform_values! { |value| value.delete'$'}
trading_hash.transform_values! { |value| value.to_f}

puts trading_hash