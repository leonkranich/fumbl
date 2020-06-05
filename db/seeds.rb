require "date"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Instrument.destroy_all
Genre.destroy_all
Review.destroy_all
Voucher.destroy_all
Homework.destroy_all
Timeslot.destroy_all
Availability.destroy_all
User.destroy_all if Rails.env.development?


# #------ User seed -------

email1 = "host1@test.de"
password1 = "host123456"
password_confirmation1 = "host123456"
first_name1 = "Eric"
last_name1 = "Clapton"
address1 = "Stromstraße 2, 10555 Berlin"
teacher1 = true
price_per_hour1 = 40
description1 = "Just a guy, who loves great riffs, run some giggs and teach people to rock like hell!"
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!

user1 = User.create(email: email1, password: password1, password_confirmation: password_confirmation1, first_name: first_name1, last_name: last_name1, address: address1, teacher: teacher1, price_per_hour: price_per_hour1, description: description1)


email2 = "host2@test.de"
password2 = "host123456"
password_confirmation2 = "host123456"
first_name2 = "Kenny"
last_name2 = "McCormick"
address2 = "Warschauer Straße 55, 10243 Berlin"
teacher2 = false
# user2.photo.attach(io: photo2, filename: 'user2.png', content_type: 'image/jpg')
# user2.save!

user2 = User.create(email: email2, password: password2, password_confirmation: password_confirmation2, first_name: first_name2, last_name: last_name2, address: address2, teacher: teacher2)



email3 = "host3@test.de"
password3 = "host123456"
password_confirmation3 = "host123456"
first_name3 = "John"
last_name3 = "Lennon"
address3 = "Rudi-Dutschke-Straße 25, 10969 Berlin"
teacher3 = true
price_per_hour3 = 80
description3 = "Playing Guitar  since I can imagine. Only want advanced students!"
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!

user3 = User.create(email: email3, password: password3, password_confirmation: password_confirmation1, first_name: first_name3,  last_name: last_name3, address: address3, teacher: teacher3, price_per_hour: price_per_hour3, description: description3)
user3.save


email4 = "host4@test.de"
password4 = "host123456"
password_confirmation4 = "host123456"
first_name4 = "Linda"
last_name4 = "Mason"
address4 = "Eckertstraße  15, 10249 Berlin"
teacher4 = true
price_per_hour4 = 40
description4 = "Teaching the Violin for 5 years now. I get used to it."
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!


user4 = User.create(email: email4, password: password4, password_confirmation: password_confirmation4, first_name: first_name4, last_name: last_name4, address: address4, teacher: teacher4, price_per_hour: price_per_hour4, description: description4)
user4.save


email5 = "host5@test.de"
password5 = "host123456"
password_confirmation5 = "host123456"
first_name5 = "Dan"
last_name5 = "Brown"
address5 = "Stromstraße 5, 10555 Berlin"
teacher5 = true
price_per_hour5 = 30
description5 = "I am quite new in the business of teaching, even though I play the piano since I was 5 years old."
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!


user5 = User.create(email: email5, password: password5, password_confirmation: password_confirmation5, first_name: first_name5, last_name: last_name5, address: address5, teacher: teacher5, price_per_hour: price_per_hour5, description: description5)
user5.save


email6 = "host6@test.de"
password6 = "host123456"
password_confirmation6 = "host123456"
first_name6 = "Martina"
last_name6 = "Senorita"
address6 = "Frankfurter Allee 12, 10247 Berlin"
teacher6 = true
price_per_hour6 = 50
description6 = "I am just in love with Vocals!! Nothing more to say, I guess ;)"
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!


user6 = User.create(email: email6, password: password6, password_confirmation: password_confirmation6, first_name: first_name6, last_name: last_name6, address: address6, teacher: teacher6, price_per_hour: price_per_hour6, description: description6)
user6.save


email7 = "host7@test.de"
password7 = "host123456"
password_confirmation7 = "host123456"
first_name7 = "Jeffrey"
last_name7 = "Lebowski"
address7 = "Unter den Linden 25, 10117 Berlin"
teacher7 = true
price_per_hour7 = 40
description7 = "I am totally into classicla Music, which why I am playing the Clarinette. If you like, I can teach you, but I am very strict!"
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!

user7 = User.create(email: email7, password: password7, password_confirmation: password_confirmation7, first_name: first_name7, last_name: last_name7, address: address7, teacher: teacher7, price_per_hour: price_per_hour7, description: description7)
user7.save


email8 = "host8@test.de"
password8 = "host123456"
password_confirmation8 = "host123456"
first_name8 = "Jimmy"
last_name8 = "Hendrix"
address8 = "Adalbertstraße 88, 10997 Berlin"
teacher8 = true
price_per_hour8 = 20
description8 = "IF you like the good old Jimmy Hendrix style, then I am your man!"
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
# user1.save!


user8 = User.create(email: email8, password: password8, password_confirmation: password_confirmation8, first_name: first_name8, last_name: last_name8, address: address8, teacher: teacher8, price_per_hour: price_per_hour8, description: description8)
user8.save


puts "Users created"



# #------- Instrument seed --------

name1 = "Guitar"
experience1 = "Playing Guitar since I can think of, played in 5 bands so far and increased my knowledge being on stage in every possible moment"
years_of_experience1 = 5
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
price_cents1 = 200
teacher_id1 = user1.id
student_id1 = user2.id

voucher1 = Voucher.new(counter: counter1, teacher_id: teacher_id1, student_id: student_id1, price_cents: price_cents1)
voucher1.save



# #------- Avaialbilities seed --------

teacher_id1 = user1.id
day1 = Date.new(2020,6,6)

availability1 = Availability.new(teacher_id: teacher_id1, day: day1)
availability1.save


teacher_id2 = user1.id
day2 = Date.new(2020,6,7)

availability2 = Availability.create(teacher_id: teacher_id2, day: day2)
availability2.save


teacher_id3 = user1.id
day3 = Date.new(2020,6,8)

availability3 = Availability.create(teacher_id: teacher_id3, day: day3)
availability3.save

teacher_id4 = user1.id
day4 = Date.new(2020,6,9)

availability4 = Availability.new(teacher_id: teacher_id4, day: day4)
availability4.save


# #------- Timeslot seed --------




student_id1 = user2.id
availability_id1 = availability1.id
start_time1 = Time.new(2020,6,6,4,0,0)
end_time1 = Time.new(2020,6,6,5,0,0)
booked1 = false

student_id2 = user2.id
availability_id2 = availability2.id
start_time2 = Time.new(2020,6,7,4,0,0)
end_time2 = Time.new(2020,6,7,5,0,0)
booked2 = false

timeslot2 = Timeslot.create(student_id: student_id2, availability_id: availability_id2, start_time: start_time2, end_time: end_time2, booked: booked2)
timeslot2.save


student_id3 = user2.id
availability_id3 = availability2.id
start_time3 = Time.new(2020,6,7,5,0,0)
end_time3 = Time.new(2020,6,7,6,0,0)
booked3 = true

timeslot3 = Timeslot.create(student_id: student_id3, availability_id: availability_id3, start_time: start_time3, end_time: end_time3, booked: booked3)
timeslot3.save


student_id4 = user2.id
availability_id4 = availability3.id
start_time4 = Time.new(2020,6,8,10,0,0)
end_time4 = Time.new(2020,6,8,11,0,0)
booked4 = false

timeslot4 = Timeslot.create(student_id: student_id4, availability_id: availability_id4, start_time: start_time4, end_time: end_time4, booked: booked4)
timeslot4.save


student_id5 = user2.id
availability_id5 = availability3.id
start_time5 = Time.new(2020,6,8,3,0,0)
end_time5 = Time.new(2020,6,8,4,0,0)
booked5 = false

timeslot5 = Timeslot.create(student_id: student_id5, availability_id: availability_id5, start_time: start_time5, end_time: end_time5, booked: booked5)
timeslot5.save


student_id6 = user2.id
availability_id6 = availability3.id
start_time6 = Time.new(2020,6,8,5,0,0)
end_time6 = Time.new(2020,6,8,6,0,0)
booked6 = false

timeslot6 = Timeslot.create(student_id: student_id6, availability_id: availability_id6, start_time: start_time6, end_time: end_time6, booked: booked6)
timeslot6.save


student_id7 = user2.id
availability_id7 = availability4.id
start_time7 = Time.new(2020,6,9,10,0,0)
end_time7 = Time.new(2020,6,9,11,0,0)
booked7 = false

timeslot7 = Timeslot.create(student_id: student_id7, availability_id: availability_id7, start_time: start_time7, end_time: end_time7, booked: booked7)
timeslot7.save


# #------- Homework seed --------

homework_id1 = timeslot3.id
description1 = "Look in the music sheets, I put some notes into it, greets Eric"


homework1 = Homework.new(timeslot_id: timeslot3.id, description: description1)
homework1.save



