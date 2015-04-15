p = Project.find "test-shipping-campaign"
str = '[{"name":"Ships Worldwide for 10","fees":{"everywhere":10}},
   {"name":"Ships to US, EU and DE","fees":{"european_union":10,"US":20,"DE":0}},
   {"name":"Ships to 6 countries and more","fees":{"VI":60,"WF":50,"EH":40,"YE":30,"ZM":20,"ZW":10}}]'

JSON.parse(str).each do |item|
     perk = p.perks.where(label: item["name"]).last
     perk.create_shipping(fees: item["fees"].to_json)
   end







# OR if we want to overwrite all existing PerkShippings for the perks in this list...

JSON.parse(str).each do |item|
     perk = p.perks.where(label: item["name"]).last
     perk.shipping.delete if perk.shipping.present?
     perk.create_shipping(fees: item["fees"].to_json)
   end
