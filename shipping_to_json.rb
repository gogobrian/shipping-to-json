# Takes a tab separated CSV file with country codes and prices and outputs 
# a json file for use with perks

require "csv"
require "json"

parsed_file = CSV.read("data.tsv", { :col_sep => "\t", :headers => true})

perks = []

# starts on the 3rd column (1st perk) and iterates through the columns
# filling up the hash with the perk id and the country code and prices
2.upto(parsed_file.first.length-1) do |i|
	perk = {
		id: parsed_file.headers[i],
		fees: {}
	}
		parsed_file.each do |row|	
			if row[i] != nil
				perk[:fees][row["Country Code"]] = row[i]
			end
		end

	perks.push(perk)
end

# writes the output to a json file 
File.open("temp.json","w") do |f|
  f.write(perks.to_json)
end