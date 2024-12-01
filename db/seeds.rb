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

# Create products
p1 = Product.find_or_create_by!(
  name: "Remera Rojo Fuego",
  description: "La mejor remera que te prende fuego",
  stock: 100,
  price: 29.99,
  size: Size.find_by(name: "M"),
  color:  Color.find_by(name: "Rojo")
)
p1.categories = [
  Category.find_by(name: "Remera"),
  Category.find_by(name: "Verano"),
  Category.find_by(name: "Mujer")
]

p2 = Product.find_or_create_by!(
  name: "Camisa Azul Cielo",
  description: "Una camisa azul como el cielo",
  stock: 50,
  price: 49.99,
  size: Size.find_by!(name: "S"),
  color: Color.find_by!(name: "Azul"),
)
p2.categories = [ Category.find_by(name: "Remera"), Category.find_by(name: "Invierno"), Category.find_by(name: "Hombre") ]

p3 = Product.find_or_create_by!(
  name: "Pantalón Verde Bosque",
  description: "Pantalones verdes como el bosque",
  stock: 75,
  price: 59.99,
  size: Size.find_by!(name: "L"),
  color: Color.find_by!(name: "Verde")
)
p3.categories = [ Category.find_by(name: "Pantalon"), Category.find_by(name: "Otoño"), Category.find_by(name: "Hombre") ]

# Create users
User.find_or_create_by!(username: "admin", email: "admin@avivas.com", name: "Admin 1") do |user|
  user.password = "admin"
  user.role = "admin"
end

User.find_or_create_by!(username: "man", email: "man@avivas.com", name: "Man 1") do |user|
  user.password = "man"
  user.role = "manager"
end

User.find_or_create_by!(username: "emp", email: "emp@avivas.com", name: "Emp 1") do |user|
  user.password = "emp"
  user.role = "employee"
end

puts "Categorias: #{Category.count} | Talles #{Size.count} | Colores: #{Color.count} | Usuarios: #{User.count} | Productos: #{Product.count}"
