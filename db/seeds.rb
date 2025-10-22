
# Propiedades
Property.destroy_all

puts "Creando Propiedades"
puts "--------------------------"

Property.create(dirección: "Puerto de Mayorca #115", colonia: "Arbide", account_id: 1, cuartos: 2, baños: 3, extras: "Cocina Integral, Cuarto de Servicio, Cochera", precio: 1250000)

Property.create(dirección: "Jardin de Bugambilias #123", colonia: "Gran Jardin", account_id: 1, cuartos: 3, baños: 3, extras: "Patio, Cochera de 2 Autos, Calentador Solar", precio: 1450000)

Property.create(dirección: "Santiago 121", colonia: "Balcones del Campestre", account_id: 1, cuartos: 3, baños: 3.5, extras: "Cochera para 4 coches, Cuarto de Servicio, Alberca, Cocina Electrica", precio: 1450000)

Property.create(dirección: "Torre Adamant Int. 31", colonia: "Cerro Gordo", account_id: 1, cuartos: 2, baños: 1, extras: "Cocina Integral, Cuarto de Servicio, Cochera de un auto, amenidades del edificio", precio: 1800000)

Property.create(dirección: "Monte Everest #231", colonia: "Cumbres del Campestre", account_id: 1, cuartos: 5, baños: 3, extras: "Cocina Integral, Cuarto de Servicio, Cochera", precio: 12000000)