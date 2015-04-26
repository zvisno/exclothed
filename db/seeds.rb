# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
   Color.create([{ name: 'Red' }, { name: 'Blue' }, {name: 'Black'}, {name: 'White'}, {name: 'Yellow'}])
   Size.create([{name: 'XSmall'}, {name: 'Small'}, {name: 'Medium'}, {name: 'Large'}, {name: 'XLarge'}])
   ClothingType.create([{name: 'Skirt'}, {name: 'Trausers'}, {name: 'Jeans'}, {name: 'Blouse'}, {name: 'Dress'}, {name: 'T-shirt'}, {name: 'Shirt'}, {name: 'shorts'}])
