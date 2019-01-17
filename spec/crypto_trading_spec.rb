require_relative "../lib/crypto_trading"

describe "the cryptozer method" do

	it "should return the same lenght" do
		expect(cryptozer.length).to eq(cryptozer.length)
	end

	it "should return the same value" do

		expect(cryptozer[50]).to eq(cryptozer[50])
		expect(cryptozer[23]).to eq(cryptozer[23])
		expect(cryptozer[98]).to eq(cryptozer[98])
	end

	it "should return not nil" do

		expect(cryptozer[89]).not_to be_nil
		expect(cryptozer[12]).not_to be_nil
		expect(cryptozer[327]).not_to be_nil

	end
end

