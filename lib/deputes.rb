require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def scraping_name
	name1 = []
	i = 0
	if i == 0
	doc = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50#pagination_deputes"))
	doc.xpath('//*[@id="content"]/div[1]/ul/li[1]/h2').each do |node|
	name1 << node.text
	end
	end
	i += 50
	while i < 600
	doc = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&debut_deputes=#{i}#pagination_deputes"))
	doc.xpath('//*[@id="content"]/div[1]/ul/li[1]/h2').each do |node|
	  name1 << node.text
	end
		i += 50
	end
	name1 = name1.map { |x| x.gsub('M ', '')}
	name1 = name1.map { |x| x.gsub('Mme ', '')}
	#puts name1.sort
	#puts name1.size
	return name1
end

def scraping_email
	email1 = []
	i = 0
	if i == 0
	doc = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50#pagination_deputes"))
	doc.xpath('//*[@id="content"]/div[1]/ul/li[5]/a').each do |node|
	email1 << node.text
	end
	end
	i += 50
	while i < 600
	doc = Nokogiri::HTML(open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&debut_deputes=#{i}#pagination_deputes"))
	doc.xpath('//*[@id="content"]/div[1]/ul/li[5]/a').each do |node|
	  email1 << node.text
	end
		i += 50
	end
	email1 = email1.select { |v| v.include? "@assemblee-nationale.fr" }
	email1 = email1.uniq
	#puts email1.sort
	#puts email1.size
	return email1
end

def join(scraping_name, scraping_email)
	test1 = []
	results_hash = []
	results_hash = scraping_name.zip(scraping_email).to_h
	results_hash.each { |record2, record| test1 << { record2[0..577] => record[0..577] } }
	puts test1

end

def perform
	scraping_name
	scraping_email
	join(scraping_name, scraping_email)
end

perform

