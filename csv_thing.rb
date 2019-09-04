require 'CSV'

users = [{
  :email => "random-user-1@alamedamortgage.com", :name => "Test User 1", :points => 0
}, {
  :email => "random-user-2@alamedamortgage.com", :name => "Test User 2", :points => 0
}, {
  :email => "random-user-3@alamedamortgage.com", :name => "Test User 3", :points => 0
}, {
  :email => "random-user-4@alamedamortgage.com", :name => "Test User 4", :points => 15
}, {
  :email => "random-user-5@alamedamortgage.com", :name => "Test User 5", :points => 0
}, {
  :email => "random-user-6@alamedamortgage.com", :name => "Test User 6", :points => 104
}]

CSV.open("users_csv.csv", "wb") do |csv|
  csv << ["email", "name", "points"]

  users.each do |user|
    csv << [user[:email], user[:name], user[:points]]
  end
end
