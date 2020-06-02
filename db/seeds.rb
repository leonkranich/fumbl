require "date"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all if Rails.env.development?
Instrument.destroy_all
Genre.destroy_all
Review.destroy_all
Voucher.destroy_all
Availability.destroy_all
Timeslot.destroy_all
Homework.destroy_all


# #------ User seed -------

email1 = "host1@test.de"
password1 = "host123456"
password_confirmation1 = "host123456"
name1 = "Eric Cartman"
address1 = "Stromstraße 2, 10555 Berlin"
teacher1 = true
price_per_hour1 = 40
description1 = "Just a guy, who loves great riffs, run some giggs and teach people to rock like hell!"
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!


user1 = User.new(email: email1, password: password1, password_confirmation: password_confirmation1, name: name1, address: address1, teacher: teacher1, price_per_hour: price_per_hour1, description: description1)
user1.save


email2 = "host2@test.de"
password2 = "host123456"
password_confirmation2 = "host123456"
name2 = "Kenny McCormick"
address2 = "Warschauer Straße 55, 10243 Berlin"
teacher2 = false
# user2.photo.attach(io: photo2, filename: 'user2.png', content_type: 'image/jpg')
# user2.save!

user2 = User.create(email: email2, password: password2, password_confirmation: password_confirmation2, name: name2, address: address2, teacher: teacher2)
user2.save


# email3 = "host3@test.de"
# password3 = "host123456"
# password_confirmation3 = "host123456"
# address3 = "Müllerstraße 30, 13353 Berlin"

# user3 = User.create(email: email3, password: password3, address: address3, password_confirmation: password_confirmation3)
# user3.save


# email4 = "host4@test.de"
# password4 = "host123456"
# password_confirmation4 = "host123456"
# address4 = "Manteuffelstraße 14, 10997 Berlin"

# user4 = User.create(email: email4, password: password4, address: address4, password_confirmation: password_confirmation4)
# user4.save

puts "Users created"



# #------- Instrument seed --------

name1 = "Gituar"
experience1 = "Playing Guitar since I can think of, played in 5 bands so far and increased my knowledge being on stage in every possible moment"
years_of_experience = 5
user_id1 = user1.id


instrument1 = Instrument.new(name: name1, experience: experience1, years_of_experience: years_of_experience1, user_id: user_id1)
instrument1.save

# name2 = "Gibson LP 57 Black Beauty Gloss"
# description2 = "1957 Black Beauty Custom Shop Model made from mahagony"
# price_per_day2 = 170
# user_id2 = user1.id


# instrument2 = Instrument.new(name: name2, experience: experience2, years_of_experience: years_of_experience2, user_id: user_id2)



# #------- Genre seed --------

name1 = "Alternative Rock"
user_id1 = user1.id

genre1 = Genre.new(name: name1, user_id: user_id1)
genre1.save



# #------- Review seed --------

content1 = "Eric is a hell of a teacher!!! I am so happy that I found him. Thank you FUMBL!"
teacher_id1 = user1.id
student_id1 = user2.id


review1 = Review.new(content: content1, teacher_id: teacher_id1, student_id: student_id1)
review1.save



# #------- Voucher seed --------

counter1 = 5
total_price1 = 200
teacher_id1 = user1.id
student_id1 = user2.id

voucher1 = Voucher.new(counter: counter1, teacher_id: teacher_id1, student_id: student_id1, total_price: total_price1)
voucher1.save



# #------- Avaialbilities seed --------

teacher_id1 = user1.id
day1 = Date.new(2020,6,6)

availability1 = Availability.new(teacher_id: teacher_id1, day: day1)
availability1.save



# #------- Timeslot seed --------

student_id1 = user2.id
availability_id1 = availability1.id
start_time1 = DateTime.new(2020,6,6,4,0,0)
end_time1 = DateTime.new(2020,6,6,5,0,0)
booked = false

timeslot1 = Timeslot.new(student_id: student_id1, availability_id: availability_id1, start_time: start_time1, end_time: end_time1, booked: booked1)
timeslot1.save



# #------- Homework seed --------

homework_id1 = timeslot1.id
description1 = "Look in the music sheets, I put some notes into it, greets Eric"


homework1 = Homework.new(timeslot_id: timeslot_id1, description_id: description_id1)
homework1.save























# instrument1 = Instrument.new(name: name1, category: category1, description: description1,
#   price_per_day: price_per_day1, user_id: user_id1)
# instrument1.photo.attach(io: photo1, filename: 'instrument1.png', content_type: 'image/jpg')
# instrument1.save!

# name2 = "Gibson LP 57 Black Beauty Gloss"
# photo2 = URI.open("https://images.gibson.com/Products/Electric-Guitars/2018/Custom/57-LP-Custom/LPB57VOEBGH1_ELECTRONICS_GLAM.jpg")
# category2 = "Guitar"
# description2 = "1957 Black Beauty Custom Shop Model made from mahagony"
# price_per_day2 = 170
# user_id2 = user1.id

# instrument2 = Instrument.new(name: name2, category: category2, description: description2,
#   price_per_day: price_per_day2, user_id: user_id2)
# instrument2.photo.attach(io: photo2, filename: 'instrument2.png', content_type: 'image/jpg')
# instrument2.save


# name3 = "Epi­phone Les Paul Classic Worn HC"
# photo3 = URI.open("https://www.session.de/out/pictures/generated/product/1/665_665_75/EPIPHONE_Les_Paul_Classic_Worn_HC.jpg")
# category3 = "Guitar"
# description3 = "1957 Black Beauty Custom Shop Model made from mahagony"
# price_per_day3 = 90
# user_id3 = user3.id

# instrument3 = Instrument.new(name: name3, photo: photo3, category: category3, description: description3,
#   price_per_day: price_per_day3, user_id: user_id3)
# instrument3.photo.attach(io: photo3, filename: 'instrument3.png', content_type: 'image/jpg')
# instrument3.save


# name4 = "Steinway & Sons M-170 black mat"
# photo4 = URI.open("https://images.static-thomann.de/pics/bdb/475041/14498364_800.jpg")
# category4 = "Piano"
# description4 = "Made in 1949 with a unique sound"
# price_per_day4 = 700
# user_id4 = user4.id

# instrument4 = Instrument.new(name: name4, photo: photo4, category: category4, description: description4,
#   price_per_day: price_per_day4, user_id: user_id4)
# instrument4.photo.attach(io: photo4, filename: 'instrument4.png', content_type: 'image/jpg')
# instrument4.save


# name5 = "Steinway & Sons O-180 Walnut"
# photo5 = URI.open("https://images.static-thomann.de/pics/bdb/437491/13066621_800.jpg")
# category5 = "Piano"
# description5 = "Made in 1925, characterized by a precise sound"
# price_per_day5 = 1000
# user_id5 = user1.id

# instrument5 = Instrument.new(name: name5, category: category5, photo: photo5, description: description5,
#   price_per_day: price_per_day5, user_id: user_id5)
# instrument5.photo.attach(io: photo5, filename: 'instrument5.png', content_type: 'image/jpg')
# instrument5.save


# name6 = "Franz Sandner Master de luxe Stra­di­vari"
# photo6 = URI.open("https://images.static-thomann.de/pics/bdb/472492/14670721_800.jpg")
# category6 = "Violin"
# description6 = "Similar to Stra­di­vari"
# price_per_day6 = 200
# user_id6 = user4.id

# instrument6 = Instrument.new(name: name6, photo: photo6, category: category6, description: description6,
#   price_per_day: price_per_day6, user_id: user_id6)
# instrument6.photo.attach(io: photo6, filename: 'instrument6.png', content_type: 'image/jpg')
# instrument6.save


# name7 = "Scala Vil­agio PSH07/​B Solo Violin Guar­neri"
# photo7 = URI.open("https://images.static-thomann.de/pics/bdb/478777/14902035_800.jpg")
# category7 = "Violin"
# description7 = "Made in Germany out of bavarian spruce"
# price_per_day7 = 700
# user_id7 = user3.id

# instrument7 = Instrument.new(name: name7, photo: photo7, category: category7, description: description7,
#   price_per_day: price_per_day7, user_id: user_id7)
# instrument7.photo.attach(io: photo7, filename: 'instrument7.png', content_type: 'image/jpg')
# instrument7.save


# name8 = "Bach 180-37 ML Trumpet"
# photo8 = URI.open("https://www.thomann.de/pics/bdb/100205/6947433_800.jpg")
# category8 = "Trumpet"
# description8 = "Great sound because of brass quality"
# price_per_day8 = 150
# user_id8 = user1.id

# instrument8 = Instrument.new(name: name8, category: category8, photo: photo8, description: description8,
#   price_per_day: price_per_day8, user_id: user_id8)
# instrument8.photo.attach(io: photo8, filename: 'instrument8.png', content_type: 'image/jpg')
# instrument8.save

# puts "Instrument created"


# # #------ Seed bookings -------

# instrument_id1 = instrument3.id
# user_id1 = user2.id
# start_date1 = Date.civil(2020,7,12)
# end_date1 = Date.civil(2020,7,20)
# difference1 = (end_date1 - start_date1).to_i
# total_price1 = difference1 * instrument3.price_per_day
# status1 = "accept"

# booking1 = Booking.new(instrument_id: instrument_id1, user_id: user_id1,
#   start_date: start_date1, end_date: end_date1, total_price: total_price1, status: status1)
# booking1.save!


# instrument_id2 = instrument5.id
# user_id2 = user4.id
# start_date2 = Date.civil(2020,6,1)
# end_date2 = Date.civil(2020,6,5)
# difference2 = (end_date1 - start_date1).to_i
# total_price2 = difference1 * instrument3.price_per_day
# status2 = "pending"

# booking2 = Booking.new(instrument_id: instrument_id2, user_id: user_id2,
#   start_date: start_date2, end_date: end_date2, total_price: total_price2, status: status2)
# booking1.save!


# instrument_id3 = instrument6.id
# user_id3 = user1.id
# start_date3 = Date.civil(2020,7,1)
# end_date3 = Date.civil(2020,7,4)
# difference3 = (end_date1 - start_date1).to_i
# total_price3 = difference1 * instrument3.price_per_day
# status3 = "accept"

# booking3 = Booking.new(instrument_id: instrument_id3, user_id: user_id3,
#   start_date: start_date3, end_date: end_date3, total_price: total_price3, status: status3)
# booking3.save!


# instrument_id4 = instrument2.id
# user_id4 = user2.id
# start_date4 = Date.civil(2020,8,1)
# end_date4 = Date.civil(2020,8,20)
# difference4 = (end_date1 - start_date1).to_i
# total_price4 = difference1 * instrument3.price_per_day
# status4 = "pending"

# booking4 = Booking.new(instrument_id: instrument_id4, user_id: user_id4,
#   start_date: start_date4, end_date: end_date4, total_price: total_price4, status: status4)
# booking4.save!


# instrument_id5 = instrument8.id
# user_id5 = user3.id
# start_date5 = Date.civil(2020,7,4)
# end_date5 = Date.civil(2020,7,7)
# difference5 = (end_date1 - start_date1).to_i
# total_price5 = difference1 * instrument3.price_per_day
# status5 = "accept"

# booking5 = Booking.new(instrument_id: instrument_id5, user_id: user_id5,
#   start_date: start_date5, end_date: end_date5, total_price: total_price5, status: status5)
# booking5.save!

# puts "Bookings created"
