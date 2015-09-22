# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hackers = [
	["Michael", "Desmond", "limiter", "#gagalmoveon", "m_desmond@live.com", "120"],
	["Febryan", "Margali", "theAJFM", "#jomblotolol", "febryanmargali90@gmail.com", "100"],
	["Ronald", "Thiodorus", "ronthod", "#plgabut", "tsun4life@gmail.com", "10"]
]

problemsetters = [
	["Azmed", "Ariotedjo", "Xaneous", "#savvyveteran", 0]
]

bundles = [
	["Algorithms", "Cool name and cool way of solving problems"],
	["Machine Learning", "No machines involved. Just learning, a ton of 'em."],
	["Miscellaneous", "Sigh.. Deciding what kinds of problems these are is a problem in itself."],
	["Mathematics", "Boring? Not if you code it out."]
]
hackers.each do |data|
	Hacker.create(firstname:data[0], lastname:data[1], username:data[2], password:data[3], email:data[4], rating:data[5])
end

problemsetters.each do |data|
	ProblemSetter.create(firstname:data[0], lastname:data[1], username:data[2], password:data[3], totalproblemsuploaded:data[4])
end

bundles.each do |data|
	Bundle.create(BundleName:data[0], BundleDescription:data[1])
end