# Setting Shipping Fees on a Perk
**Takes a tab separated CSV and converts it to json to use in setting the shipping costs on a perk.**


## Steps
1. Use shipping_to_json.rb to create a JSON of the shipping costs for the perks.
2. Take the JSON and copy the output to your clipboard
3. SSH into chicago indiegogo 01 (or staging) and cd to current, run `bundle exec rails c`
4. Use import-command.rb to get the rails commands to add or update the shippings costs for a campaign
  - set `p` to the project slug or ID
  - set `str` to the JSON you copied earlier.  Wrap it in single quotes, front and back. 
  - copy and run the first `JSON.parse(str).each do` block to set the shipping fees.
  - use the bottom `JSON` block for deleting and making new shipping fees (ie. you want to update a perk with existing fees). 
