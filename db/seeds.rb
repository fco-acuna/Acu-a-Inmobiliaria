puts "Borrando datos pasados"
puts "-"*20
# Propiedades
Property.destroy_all
Account.destroy_all

puts "Datos borrados exitosamente"
puts "-"*20

puts "Creando usuarios"
puts "-"*20
Account.create!(first_name: "Admin", email: "pacs@gmail.com", password: "123456")

puts "Usuarios creados correctamente"
puts "-"*20
puts "H4PPY C0D1NG! :)"