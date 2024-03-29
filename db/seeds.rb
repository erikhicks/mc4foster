# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Item Requests extension
Refinery::ItemRequests::Engine.load_seed

# Added by Refinery CMS Help Requests extension
Refinery::HelpRequests::Engine.load_seed

# Added by Refinery CMS Memberships engine
Refinery::Memberships::Engine.load_seed

# Added by Refinery CMS Venues extension
Refinery::Calendar::Engine.load_seed
