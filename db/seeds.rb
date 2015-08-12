# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
colors = [
    {name: 'Red' },
    {name: 'Blue' },
    {name: 'Black'},
    {name: 'White'},
    {name: 'Yellow'},
    {name: 'Orange'}
]

color = Color.new
colors.each{ |c|
  if !color.get_color(c[:name])
    color.create_color(c[:name])
  end
}

sizes = [
    {name: 'XSmall'},
    {name: 'Small'},
    {name: 'Medium'},
    {name: 'Large'},
    {name: 'XLarge'}
]

size = Size.new
sizes.each{ |s|
  if !size.get_size(s[:name])
    size.create_size(s[:name])
  end
}

clothing_types = [
    {name: 'Skirt'},
    {name: 'Trausers'},
    {name: 'Jeans'},
    {name: 'Blouse'},
    {name: 'Dress'},
    {name: 'T-shirt'},
    {name: 'Shirt'},
    {name: 'Shorts'}
]

clothing_type = ClothingType.new
clothing_types.each{ |ct|
  if !clothing_type.get_clothing_type(ct[:name])
    clothing_type.create_clothing_type(ct[:name])
  end
}

clothing_brands = [
    {name: 'Oasis'},
    {name: 'COS'},
    {name: 'We'},
    {name: 'HUGO BOSS'},
    {name: 'Tommy Hilfiger'},
    {name: 'Chanel'},
    {name: 'Lacoste'},
    {name: 'Armani'},
    {name: 'Geox'},
    {name: 'MEXX'},
    {name: 'Intimissimi'},
    {name: 'La Perla'},
    {name: 'Diesel'},
    {name: 'Dolce & Gabbana'},
    {name: 'Kappa'},
    {name: 'Gucci'},
    {name: 'Miu Miu'},
    {name: 'Chloe'},
    {name: 'Gres'},
    {name: 'Sissy-Boy'},
    {name: 'A.F.C.A'},
    {name: 'G-Star Raw'},
    {name: '10 feet'}
]

clothing_brand = ClothingBrand.new
clothing_brands.each{ |cb|
  if !clothing_brand.get_clothing_brand(cb[:name])
    clothing_brand.create_clothing_brand(cb[:name])
  end
}