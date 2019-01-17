require_relative "../lib/deputes"

describe "scraping_name method" do
	it "should return the array name1 length" do
		expect(scraping_name.length).to eq(577)
	end
end

#describe "the scrap_deputy_name_email method" do
#    it "should return hash with values != nil" do
#        get_deputy_url.each do |hash|
#     		expect(hash.values).not_to be_nil
#   		end
#    end
#end