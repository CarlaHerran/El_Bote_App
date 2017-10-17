# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).



user1 = User.create!(name:  "Carla Herrán",
             email: "carla.herran@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)


# user2 =User.create!(name:  "Carolina M",
#              email: "caro@mail.com",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: false)


# user3 =User.create!(name:  "Valentín S",
#              email: "valentin@mail.com",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: false)


# user4 =User.create!(name:  "Abel Hernández",
#              email: "herdez@gmail.com",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: false)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


boat1 = Boat.create(name: "San Piter")
# boat2 = Boat.create(name: "Changuis")
# boat3 = Boat.create(name: "Rors")


ocean1 = Ocean.create(user_id: user1.id, boat_id: boat1.id)
# Aquí "hice trampa" porque comenté los oceans a los que pertenecen los usuarios, para no tener problemas al querer eliminarlos.
# Me daba este error:
# ActiveRecord::InvalidForeignkey in UsersController#destroy
# SQLite3::Constraint Exception:ForeignKey constraint failed:DELETE FROM "users" WHERE "users"."id"=?
# En esta línea:
# ----- User.find(params[:id]).destroy ----
# ocean2 = Ocean.create(user_id: user2.id, boat_id: boat1.id)
# ocean3 = Ocean.create(user_id: user3.id, boat_id: boat1.id)
# ocean4 = Ocean.create(user_id: user4.id, boat_id: boat3.id)



category1 = Category.create(name: "Cocina")
category2 = Category.create(name: "Baño")
category3 = Category.create(name: "Sala")
category4 = Category.create(name: "Servicios")
category5 = Category.create(name: "Daños")

product1 = Product.create(name: "Garrafón Agua", category_id: category1.id)
product2 = Product.create(name: "Trapo", category_id: category1.id)
product3 = Product.create(name: "Salsa Inglesa", category_id: category1.id)

product4 = Product.create(name: "Papel de Baño", category_id: category2.id)
product5 = Product.create(name: "Jabón de Manos", category_id: category2.id)
product6 = Product.create(name: "Pasta Dental", category_id: category2.id)

product7 = Product.create(name: "Foco", category_id: category3.id)
product8 = Product.create(name: "Escoba", category_id: category3.id)
product9 = Product.create(name: "Cojín", category_id: category3.id)

product10 = Product.create(name: "Gas", category_id: category4.id)
product11 = Product.create(name: "Luz", category_id: category4.id)
product12 = Product.create(name: "Agua", category_id: category4.id)
product13 = Product.create(name: "Internet", category_id: category4.id)

product14 = Product.create(name: "Vajilla", category_id: category5.id)
product15 = Product.create(name: "Muebles", category_id: category5.id)
product16 = Product.create(name: "Otro", category_id: category5.id)


record1 = Record.create(boat_id: boat1.id, product_id: product1.id, mes: "Octubre", account: 50.50)
record2 = Record.create(boat_id: boat1.id, product_id: product4.id, mes: "Octubre", account: 75.00)
record3 = Record.create(boat_id: boat1.id, product_id: product7.id, mes: "Octubre", account: 80.75)
record4 = Record.create(boat_id: boat1.id, product_id: product10.id, mes: "Octubre", account: 395.50)
record5 = Record.create(boat_id: boat1.id, product_id: product14.id, mes: "Octubre", account: 30.00)





