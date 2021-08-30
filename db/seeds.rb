puts "Creating gyms..."
Gym.create(name: "Globo Gym", rating: 1, price: 1000)
Gym.create(name: "Pewter City Gym", rating: 3, price: 50)
Gym.create(name: "Plant Fitness", rating: 4, price: 20)
Gym.create(name: "Crunch", rating: 5, price: 20)

puts "Creating members..."
Member.create(name: "Fred")
Member.create(name: "Daphne")
Member.create(name: "Velma")
Member.create(name: "Shaggy")
Member.create(name: "Scooby")

puts "Creating memberships..."

# ************************************************************************
# * TODO: create memberships! Remember, a membership belongs to a member *
# * and a membership belongs to a gym.                                   *
# ************************************************************************
# Create memberships Here
Membership.create(start_year: 2001, start_month: "January", gym_id: 1, member_id: 2)
Membership.create(start_year: 2003, start_month: "March", gym_id: 2, member_id: 1)
Membership.create(start_year: 2012, start_month: "February", gym_id: 1, member_id: 3)
Membership.create(start_year: 2013, start_month: "April", gym_id: 2, member_id: 2)
Membership.create(start_year: 2002, start_month: "May", gym_id: 3, member_id: 5)
Membership.create(start_year: 2011, start_month: "September", gym_id: 3, member_id: 4)
Membership.create(start_year: 2019, start_month: "December", gym_id: 4, member_id: 1)
Membership.create(start_year: 2021, start_month: "August", gym_id: 4, member_id: 4)

puts "Seeding done!"
