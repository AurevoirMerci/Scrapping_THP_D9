require_relative "../lib/mails_mairies"

describe "the get_townhall_urls method" do
	it "should return array_towns_emails length" do
		expect(get_townhall_urls.length).to eq(185)
	end
end

describe "the get_townhall_urls method" do
	it "should return hash with values != nil" do
		get_townhall_urls.each do |hash|
			expect(hash.values).not_to be_nil
		end
	end
end