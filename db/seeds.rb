# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

# $i = 1
# $num = 5

# until $i > $num  do
# 	Product.create!(title:"Item ##{$i}",
# 					description:
# 						%{<p>
# 							Description Of Item ##{$i} 
# 						</p>},
# 					image_url:'item.jpg',
# 					price: "#{$i*10}" )
# 	$i += 1;
# end 