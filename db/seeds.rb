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
Category.find_or_create_by!(name: "Abrigo", category_type: "clothing")
Category.find_or_create_by!(name: "Pantalon", category_type: "clothing")
Category.find_or_create_by!(name: "Calzado", category_type: "clothing")
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
products = [
  {
    name: "Blazer Elegante",
    description: "Blazer de cuello solapa y manga larga. Bolsillos de plastrón en delantero. Detalle de puntilla combinada a tono. Cierre frontal con botón.",
    stock: 100,
    price: 29.99,
    size: "M",
    color: "Blanco",
    categories: [ "Abrigo", "Otoño", "Mujer" ],
    images_path: 'blazer'
  },
  {
    name: "Sandalias",
    description: "Sandalia plana en piel con tiras cruzadas. Suela con volumen. Cierre mediante hebilla.",
    stock: 50,
    price: 49.99,
    size: "38",
    color: "Negro",
    categories: [ "Calzado", "Verano", "Mujer" ],
    images_path: 'sandalia'
  },
  {
    name: "Trench Oversize",
    description: "Trench oversize fit confeccionado en tejido de algodón. Cuello solapa y manga larga. Bolsillos de vivo en cadera. Efecto lavado. Cierre frontal con botonadura oculta por solapa.",
    stock: 75,
    price: 59.99,
    size: "L",
    color: "Verde",
    categories: [ "Abrigo", "Invierno", "Hombre" ],
    images_path: 'trench'
  },
  {
    name: "Bolso Floral",
    description: "Bolso tipo sobre en tejido. Detalle de flores en el cuerpo. Asa de mano y asa bandolera en cadena. Cierre mediante imán. Forro interior con bolsillo.",
    stock: 30,
    price: 79.99,
    size: "M",
    color: "Negro",
    categories: [ "Accesorios", "Primavera", "Mujer" ],
    images_path: 'bolso'
  },
  {
    name: "Camisa Cuadros",
    description: "Camisa boxy fit confeccionada en tejido con mezcla de viscosa y lino. Cuello bowling y manga corta. Bajo con aberturas laterales. Cierre frontal de botonadura.",
    stock: 120,
    price: 19.99,
    size: "L",
    color: "Azul",
    categories: [ "Remera", "Primavera", "Hombre" ],
    images_path: 'camisa'
  },
  {
    name: "Vestido Denim",
    description: "Vestido midi confeccionado en hilatura con mezcla de algodón. Cuello redondo y manga sisa. Detalle de abertura en espalda y pespuntes marcados ",
    stock: 80,
    price: 39.99,
    size: "S",
    color: "Rojo",
    categories: [ "Verano", "Mujer" ],
    images_path: 'vestido'
  }
]

products.each do |product_data|
  product = Product.new(
    name: product_data[:name],
    description: product_data[:description],
    stock: product_data[:stock],
    price: product_data[:price],
    size: Size.find_by!(name: product_data[:size]),
    color: Color.find_by!(name: product_data[:color])
  )
  product.categories = product_data[:categories].map { |category_name| Category.find_by!(name: category_name) }
  Dir.glob(Rails.root.join("app/assets/images/products/#{product_data[:images_path]}/*")).each do |image_path|
    product.images.attach(
      io: File.open(image_path),
      filename: File.basename(image_path),
      content_type: 'image/jpg'
    )
  end
  if !product.save
    puts "Product #{product_data[:name]} failed: #{product.errors.full_messages.join(", ")}"
  end
end

# Create users
User.find_or_create_by!(username: "admin", email: "admin@avivas.com", name: "Alice Johnson") do |user|
  user.password = "admin"
  user.role = "admin"
end

User.find_or_create_by!(username: "man", email: "man@avivas.com", name: "Bob Smith") do |user|
  user.password = "man"
  user.role = "manager"
end

User.find_or_create_by!(username: "emp", email: "emp@avivas.com", name: "Charlie Brown") do |user|
  user.password = "emp"
  user.role = "employee"
end

puts "Categorias: #{Category.count} | Talles #{Size.count} | Colores: #{Color.count} | Usuarios: #{User.count} | Productos: #{Product.count}"
