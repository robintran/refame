# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

#Create User Roles
Role.create(:title => 'Refinery')
Role.create(:title => 'Superuser')

admin  = User.create email: 'admin@refame.com', password: 'password', password_confirmation: 'password', first_name: 'admin'
admin.roles << Role.find_by_title('Refinery')
admin.roles << Role.find_by_title('Superuser')
admin.save


# Added by Refinery CMS Affiliates extension
Refinery::Affiliates::Engine.load_seed
