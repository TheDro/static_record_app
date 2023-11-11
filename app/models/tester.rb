

class Tester
  def self.generate_users(count)
    count.times do
      User.create!(
        name: FFaker::Name.name,
        email: FFaker::Internet.email,
        created_at: Time.current,
        updated_at: Time.current
      )
    end
  end

  def self.generate_addresses
    User.all.each do |user|
      Address.create!(
        street: FFaker::Address.street_address,
        city: FFaker::Address.city,
        country_id: 1,
        region_id: "ON",
        user: user
      )
    end
  end
end