require 'rubygems'
require 'nokogiri'   
require 'open-uri'


def get_townhall_urls
	cities = []
	doc = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise"))
		doc.xpath('//p/a').each do |city|
		cities << city.text
		townhall_url = city.text.downcase
		townhall_url = townhall_url.gsub(' ', '-')
		#puts townhall_url
		get_townhall_email(townhall_url)
		end
	return cities
end

def get_townhall_email(townhall_url)
	mails = []
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{townhall_url}.html"))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
	mails << email.text  
	#puts email.text
	end
	return mails
end

def join(get_townhall_urls, get_townhall_email)
	results_hash = []
	results_hash = get_townhall_urls.zip(get_townhall_email).to_h
	puts results_hash
end

def perform 
	get_townhall_urls
	join(get_townhall_urls, get_townhall_email)
end

perform

#//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[20]
#//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[2]/p/a[27]

#//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p