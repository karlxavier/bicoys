class MigrateMenuToAnother7 < ActiveRecord::Migration[5.0]
	def change
	 #  	resto7 = Restaurant.find(7)
	 #  	resto7.menu_categories.each do |menucat|
		# 	Restaurant.where.not(id: 7).each do |resto|
		# 		resto.menu_categories.create!(
		# 			:name => menucat.name,
		# 			:restaurant_id => resto.id
		# 		)
		# 	end
		# end

	 #  	resto7 = Restaurant.find(7)
	 #  	resto7.menus.each do |menu|
		# 	Restaurant.where.not(id: 7).each do |resto|
		# 		resto.menus.create!(
		# 			:name => menu.name,
		# 			:description => menu.description,
		# 			:price => menu.price,
		# 			:restaurant_id => resto.id,
		# 			:total_price => menu.total_price,
		# 			:menu_category_id => menu.menu_category_id,
		# 			:commission => menu.commission,
		# 			:image => menu.image
		# 		)
		# 	end
		# end

	end
end
