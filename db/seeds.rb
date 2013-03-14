require 'factory_girl'

# Base user
user = FactoryGirl.create(:user, email: 'pmoghaddam@gmail.com', password: 'password')

# Add feed content
(1..10).each do |n|
  feed = FactoryGirl.create(:feed, user: user)

  (1..20).each do |n|
    FactoryGirl.create(:feed_item, feed: feed)
  end
end
