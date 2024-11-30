# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create categories
Category.find_or_create_by!(name: "Remera", category_type: "clothing")
Category.find_or_create_by!(name: "Pantalon", category_type: "clothing")
Category.find_or_create_by!(name: "Zapatillas", category_type: "clothing")
Category.find_or_create_by!(name: "Accesorios", category_type: "clothing")
Category.find_or_create_by!(name: "Verano", category_type: "seasons")
Category.find_or_create_by!(name: "Invierno", category_type: "seasons")
Category.find_or_create_by!(name: "Primavera", category_type: "seasons")
Category.find_or_create_by!(name: "Otoño", category_type: "seasons")
Category.find_or_create_by!(name: "Hombre", category_type: "gender")
Category.find_or_create_by!(name: "Mujer", category_type: "gender")
Category.find_or_create_by!(name: "Niño", category_type: "gender")

# Create sizes
[ "XS", "S", "M", "L", "XL", "37", "38", "39", "40", "41" ].each do |size_name|
    Size.find_or_create_by!(name: size_name)
end

# Create colors
Color.find_or_create_by!(name: "Rojo", hex_value: "#FF0000")
Color.find_or_create_by!(name: "Azul", hex_value: "#0000FF")
Color.find_or_create_by!(name: "Verde", hex_value: "#00FF00")
Color.find_or_create_by!(name: "Amarillo", hex_value: "#FFFF00")
Color.find_or_create_by!(name: "Blanco", hex_value: "#FFFFFF")
Color.find_or_create_by!(name: "Negro", hex_value: "#000000")

puts "Categorias: #{Category.count} | Talles #{Size.count} | Colores: #{Color.count}"
