# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(:login => 'administrador', :password => '123456', :password_confirmation => '123456', :email => "admin@mail.com", name: "administrador", :role_ids => "")

admin.save

r = Role.new
r.name = 'admin'
r.save

r2 = Role.new
r2.name = 'membro'
r2.save

r3 = Role.new
r3.name = 'estudante'
r3.save