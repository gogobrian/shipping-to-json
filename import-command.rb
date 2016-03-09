p = Project.find "test-shipping-campaign"
str = '[{"id":"0001","fees":{"everywhere":"10"}},
   {"id":"0002","fees":{"european_union":"10","US":"20","DE":"0"}},
   {"id":"0003","fees":{"VI":"60","WF":"50","EH":"40","YE":"30","ZM":"20","ZW":"10"}}]'

JSON.parse(str).each do |item|
  perk = p.perks.find(item["id"])
  perk.shipping.delete if perk.shipping.present?
  fees = item["fees"]
  # make sure values are integers. calling to_i on an integer doesn't hurt.
  fees.each { |key, value| fees[key] = fees[key].to_i }
  perk.create_shipping(fees: fees.to_json)
  perk.shipping.save!
end
