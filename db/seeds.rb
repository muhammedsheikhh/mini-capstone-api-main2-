
10.times do |i|
    School.create!(
      name: "School #{i + 1}",
      energy_consumption: rand(50..200),
      waste_management: rand(10..50),
      transportation: rand(20..100),
      other_factors: rand(5..25),
      carbon_footprint: rand(100..400)
    )
  end

