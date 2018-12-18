5.times do
  Dish.create({
    name: Faker::Food.dish,
    description: Faker::Food.description
    })
  end
