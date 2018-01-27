# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TariffRate.create(min_km: 0.0, max_km: 1.5, min_order: 165, service_charge: 55, eta_delivery: "45min")
TariffRate.create(min_km: 1.6, max_km: 2.5, min_order: 220, service_charge: 55, eta_delivery: "45min")
TariffRate.create(min_km: 2.6, max_km: 3.5, min_order: 275, service_charge: 55, eta_delivery: "1hr")
TariffRate.create(min_km: 3.6, max_km: 4.5, min_order: 330, service_charge: 55, eta_delivery: "1hr")
TariffRate.create(min_km: 4.6, max_km: 5.5, min_order: 385, service_charge: 55, eta_delivery: "1hr")
TariffRate.create(min_km: 5.6, max_km: 6.5, min_order: 440, service_charge: 55, eta_delivery: "1.3hr")
TariffRate.create(min_km: 6.6, max_km: 10, min_order: 750, service_charge: 55, eta_delivery: "1.3hr")
TariffRate.create(min_km: 10.1, max_km: 15, min_order: 950, service_charge: 55, eta_delivery: "1.3hr")

# TariffRate.create(min_km: 0, max_km: 1.5, min_order: 165, service_charge: 35, eta_delivery: '45min')
# TariffRate.create(min_km: 1.6, max_km: 2.5, min_order: 220, service_charge: 45, eta_delivery: '45min')
# TariffRate.create(min_km: 2.6, max_km: 3.5, min_order: 275, service_charge: 50, eta_delivery: '1hr')
# TariffRate.create(min_km: 3.6, max_km: 4.5, min_order: 330, service_charge: 60, eta_delivery: '1hr')
# TariffRate.create(min_km: 4.6, max_km: 5.5, min_order: 385, service_charge: 60, eta_delivery: '1hr')
# TariffRate.create(min_km: 5.6, max_km: 6.5, min_order: 440, service_charge: 60, eta_delivery: '1.5hr')
# TariffRate.create(min_km: 6.6, max_km: 10, min_order: 550, service_charge: 60, eta_delivery: '1.5hr')
# TariffRate.create(min_km: 10.1, max_km: 15, min_order: 750, service_charge: 60, eta_delivery: '1.5hr')

Restaurant.delete_all
Restaurant.create!(name: "Penongs", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Bon Appetit! La Boutique", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Jack's Ridge", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Vikings Luxury Buffet", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Marina Tuna", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Swiss Deli", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Ahfat Seafood Plaza", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Claude's Le Cafe de Ville", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Backyard Burgers Central", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Blue Post Boiling Crabs and Shrimps", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Burger Chef", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "De Bonte Koe", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Yellow Fin Seafood Restaurant", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Penong's Barbeque Seafoods and Grill", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Cafe Tavera", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Caitlyn's Dumpling Bar", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "The Vegan Dinosaur", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Bondi&Bourke Davao", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Balik Bukid Farm & Kitchen", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Davao Dencia's Restaurant", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Nanay Bebeng Restaurant", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)
Restaurant.create!(name: "Outback Grill", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 1)

Restaurant.create!(name: "Lachi's", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Ice Giants", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Saging Repablik", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Bistro Rosario", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Aling Foping's Halo-Halo", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Krispy Kreme", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Osvaldo's Cakes", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Osvaldo's Cakes", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Gelatomania", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Green Coffee Torres", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Green Coffee Torres", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Blugre Coffee", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Roadhouse Cafe", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Starbucks Abreeza Mall", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Coffee for Peace Inc.", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "The Coffee Bean & Tea Leaf", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "J Palermo's Diner", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Kelleher's Irish-American Pub", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Julies", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Garden By The Bay", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Kaonanan Sa Tribu K’Mindanawan", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "White House", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)
Restaurant.create!(name: "Tori Grill", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 2)

Restaurant.create!(name: "Leandro’s Specialties and Catering Services", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Mila's Catering Services", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Precious Kids Catering Services", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Tita Meanne's Catering Service", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Papat's Catering Services", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Glecel-Taurus Food & Catering Services", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Rica Glad Party Shoppe Catering", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Jips Eatery and Catering Services", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Paterno's", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Mila's Catering Services", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Allmeals Restaurant & Catering Service", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)
Restaurant.create!(name: "Limitless", address: "Elustre St.", phone: "09973234343", latitude: 7.065547, longitude: 125.608295, restaurant_type_id: 3)



	# resto7 = Restaurant.find(89)
	# resto7.menu_categories.each do |menucat|
	# 	Restaurant.all.each do |resto|
	# 		resto_menu_cat = resto.menu_categories.create!(
	# 			:name => menucat.name,
	# 			:restaurant_id => resto.id
	# 		)

	# 		Menu.where(menu_category_id: menucat.id).all.each do |menu|
	# 			resto.menus.create!(
	# 				:name => menu.name,
	# 				:description => menu.description,
	# 				:price => menu.price,
	# 				:restaurant_id => resto.id,
	# 				:total_price => menu.total_price,
	# 				:menu_category_id => resto_menu_cat.id,
	# 				:commission => menu.commission,
	# 				:image => menu.image
	# 			)
	# 		end
	# 	end
	# end

	
# OrderStatus.create!(OStatus: "Pending") 	# Order not yet finished
# OrderStatus.create!(OStatus: "Failed")		# Payment failed and order cannot continue
# OrderStatus.create!(OStatus: "Processing")	# Payment received (or Cash on Delivery) then forwarded to resto
# OrderStatus.create!(OStatus: "Prepared")	# Resto food preparation	
# OrderStatus.create!(OStatus: "On d Way")	# Delivery on the way to location
# OrderStatus.create!(OStatus: "Completed")	# Order received by the user
# OrderStatus.create!(OStatus: "Cancelled")	# Cancelled by admin or the user, no further action required
# OrderStatus.create!(OStatus: "Refunded")	# Payment received but food is not available, only for online payments
# OrderStatus.create!(OStatus: "Bogus")		# Bogus or fake order

