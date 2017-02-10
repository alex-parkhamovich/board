puts "********Seeding Data Start************"

unless User.with_role(:admin).present?
  user = User.create(name: 'Admin', email: 'admin@qwe.qwe', password: '123123123', password_confirmation: '123123123')
  user.add_role :admin
end

puts "********Seeding Data End************"