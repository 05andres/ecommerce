# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Customer.delete_all
Admin.delete_all
Category.delete_all
Product.delete_all
Image.delete_all
Audit.delete_all
Purchase.delete_all

admin1 = Admin.create!(email: 'admin@example.com', name: 'admin', password: 'password', password_confirmation: 'password')
admin2 = Admin.create!(email: 'admin2@example.com', name: 'admin2', password: 'password', password_confirmation: 'password')

customer1 = Customer.create!(email: 'customer@example.com', name: 'customer')
customer2 = Customer.create!(email: 'customer2@example.com', name: 'customer2')
customers = [customer1, customer2]

categories = []
5.times do |i|
  categories << Category.create!(name: "Category #{i + 1}", creator: admin1)
end

categories.each do |category|
  Audit.create!(
    action: 'create',
    auditable: category,
    admin: admin1,
    description: "Category '\#{category.name}' created."
  )
end

products = []
categories.each do |category|
  3.times do |i|
    product = Product.create(name: "Producto #{i + 1}", description: "Descripcion del producto #{i + 1}", category: category, creator: admin2, price: rand(1000..10000))
    2.times do |j|
      Image.create(product: product, url: "https://example.com/product#{i + 1}-image#{j + 1}.jpg")
    end

    Audit.create!(
      action: 'create',
      auditable: product,
      admin: admin1,
      description: "Product #{product.name} created under category  #{category.name}'."
    )

    products << product
  end
end

products.each do |product|
  rand(5..10).times do
    quantity = rand(5..10)
    Purchase.create!(
      product: product,
      quantity: quantity,
      customer: customers[rand(0..1)],
      total_amount: product.price * quantity,
    )
  end
end

Purchase.find_each do |purchase|
  Audit.create!(
    action: 'create',
    auditable: purchase,
    admin: admin2,
    description: "Purchase of #{purchase.quantity} units of #{purchase.product.name}' created."
  )
end

puts "Seeding completed successfully!"
