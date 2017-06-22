user_list = [
  [ "Bill", "bill" ],
  [ "Ted", "ted" ],
  [ "Vladimir", "vladimir" ],
  [ "Estragon", "estragon" ]
]

user_list.each do |name, password|
  User.create(username: name, password_digest: BCrypt::Password.create(password))
end

pannier_list = [
  [ "Ortlieb Front Roller L", "Front Left", 1 ],
  [ "Ortlieb Front Roller R", "Front Right", 1 ],
  [ "Ortlieb Back Roller L", "Back Left", 1 ],
  [ "Ortlieb Back Roller R", "Back Right", 1 ],
  [ "Ortlieb Handlebar Bag", "Handlebar Bag", 1 ],
  [ "Ortlieb Rackbag", "Rack Bag", 1 ],
  [ "Carradice Super C Front L", "Front Left", 2 ],
  [ "Carradice Super C Front R", "Front Right", 2 ],
  [ "Carradice Super C Rear L", "Back Left", 2 ],
  [ "Carradice Super C Rear R", "Back Right", 2 ],
  [ "Carradice Super C Handlebar Bag", "Handlebar Bag", 2 ],
  [ "Carradice Super C Stuff Sack", "Rack Bag", 2 ],
  [ "Brooks Norfolk Front Pannier L", "Front Left", 3 ],
  [ "Brooks Norfolk Front Pannier R", "Front Right", 3 ],
  [ "Timbuk2 Alemany L", "Front Left", 4 ],
  [ "Timbuk2 Alemany R", "Front Right", 4 ],
  [ "Banjo Brothers Quick Release Waterproof Handlebar Bag", "Handlebar Bag", 4 ]

]

pannier_list.each do |name, location, user_id|
  Pannier.create(name: name, location: location, user_id: user_id)
end

item_list = [
  [ "Camping Stove", 0.3, 1 ],
  [ "Cookware", 0.4, 1 ],
  [ "Fuel Can", 0.2, 1 ],
  [ "Cassette Repair Tool", 0.1, 2 ],
  [ "First Aid Kit", 1.0, 2 ],
  [ "Spare brake pads", 0.1, 2 ],
  [ "Sleeping bag", 2.0, 3],
  [ "Rain cape", 0.2, 3 ],
  [ "Clothes bag", 2.5, 4 ],
  [ "Spare tire tubes", 1.0, 4 ],
  [ "Fleece", 0.5, 2 ],
  [ "Shoe covers", 0.2, 2 ],
  [ "Tent", 2.0, 6 ],
  [ "Multitool", 1.0, 5 ],
  [ "Sunscreen", 0.2, 5 ],
  [ "Jetboil", 0.2, 7 ],
  [ "Pots and pans", 0.3, 7 ],
  [ "MSR", 0.1, 7 ],
  [ "Spokes", 0.1, 8 ],
  [ "First Aid", 1.1, 8 ],
  [ "Brake pads", 0.1, 8 ],
  [ "Winter sleeping bag", 1.5, 9],
  [ "Rain jacket", 0.3, 9 ],
  [ "Dry bag", 2.2, 10 ],
  [ "Tubes", 0.8, 10 ],
  [ "Winter jersey", 0.4, 8 ],
  [ "Proofide", 0.1, 8 ],
  [ "Backpacking tent", 1.5, 12 ],
  [ "Tent poles", 0.2, 12 ],
  [ "Leatherman", 1.0, 11 ],
  [ "Coconut oil", 0.2, 11 ],
  [ "Almonds", 0.5, 13 ],
  [ "Peanut butter", 0.3, 13 ],
  [ "Crackers", 0.1, 13 ],
  [ "Shirts", 0.2, 14 ],
  [ "Shorts", 1.1, 14 ],
  [ "Socks", 0.1, 14 ],
  [ "Bivy", 1.5, 15],
  [ "Balaclava", 0.3, 15 ],
  [ "Energy bars", 1.0, 16 ],
  [ "Maps", 0.7, 16 ],
  [ "Chocolate", 0.3, 16 ],
  [ "Emergency beacon", 0.2, 17 ],
  [ "Pepper spracy", 0.4, 17 ],
  [ "Postcards", 0.1, 17 ]

]

item_list.each do |name, weight, pannier_id|
  Item.create(name: name, weight: weight, pannier_id: pannier_id)
end
