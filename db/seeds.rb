require "date"
require "time"
require "nokogiri"
require 'faker'

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

url = "https://www.dasoertliche.de/?kgs=11000000&choose=true&page=0&context=0&action=43&buc=2239&topKw=0&form_name=search_nat&kw=apotheke&ci=Berlin"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
addresses_array = []
html_doc.search('address').each do |element|
  addresses_array << element.text.strip
end

url = "https://www.dasoertliche.de/?wntHit=3&kw=apotheke&form_name=search_nat&ci=Berlin&context=11&page=78&action=56&kgs=11000000&radius=5&buc=2239&orderby=name&ttforderby=rel&recFrom=76"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('address').each do |element|
  addresses_array << element.text.strip
end

i = 0
until i == 50
email = Faker::Internet.email
password = "host123456"
password_confirmation = "host123456"
first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
address = addresses_array[i]
teacher = true
price_per_hour = rand(15..50)
description = "IF you like the good old Jimmy Hendrix style, then I am your man!"
# user1.photo.attach(io: photo1, filename: 'user1.png', content_type: 'image/jpg')
i += 1

user = User.create(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name, address: address, teacher: teacher, price_per_hour: price_per_hour, description: description)
user.save

end

puts "Users created"



# #------- Instrument seed --------

User.all.where(teacher: true).each do |teacher|
  instrument_array = %w[violin viola cello doublebass flute oboe clarinette bassoon trumpet horn trombone trumpet piano organ guitar bass drums other]
  instrument = Instrument.create(name: instrument_array.sample, experience: "Something", years_of_experience: rand(5..40), user_id: teacher.id)
end

puts "Instruments created"



# #------- Genre seed --------

User.all.where(teacher: true).each do |teacher|
  genre = Genre.create(name: Faker::Music.genre, user_id: teacher.id)
end

puts "Genres created"



# #------- Review seed --------

# content1 = "Eric is a hell of a teacher!!! I am so happy that I found him. Thank you FUMBL!"
# teacher_id1 = user1.id
# student_id1 = user2.id


# review1 = Review.new(content: content1, teacher_id: teacher_id1, student_id: student_id1)
# review1.save



# # #------- Voucher seed --------

# counter1 = 5
# price_cents1 = 200
# teacher_id1 = user1.id
# student_id1 = user2.id

# voucher1 = Voucher.new(counter: counter1, teacher_id: teacher_id1, student_id: student_id1, price_cents: price_cents1)
# voucher1.save

# #------- Homework seed --------

# homework_id1 = timeslot3.id
# description1 = "Look in the music sheets, I put some notes into it, greets Eric"


# homework1 = Homework.new(timeslot_id: timeslot3.id, description: description1)
# homework1.save


# ------- Availability & Timeslots seeds --------

teachers_array = User.where(teacher: true)
teachers_array.each do |teacher|
  (Date.today..Date.today + 14).to_a.each do |day|
    teacher_availability = Availability.create(teacher_id: teacher.id, day: day)
    # start_time = Time.new(teacher_availability.day.year, teacher_availability.day.month, teacher_availability.day.day,9,00,00)
    timeslots_array = [[Time.new(2000,1,1,9,00,00),Time.new(2000,1,1,10,00,00)], [Time.new(2000,1,1,10,00,00),Time.new(2000,1,1,11,00,00)], [Time.new(2000,1,1,11,00,00),Time.new(2000,1,1,12,00,00)], [Time.new(2000,1,1,13,00,00),Time.new(2000,1,1,14,00,00)], [Time.new(2000,1,1,14,00,00),Time.new(2000,1,1,15,00,00)], [Time.new(2000,1,1,15,00,00),Time.new(2000,1,1,16,00,00)], [Time.new(2000,1,1,16,00,00),Time.new(2000,1,1,17,00,00)], [Time.new(2000,1,1,17,00,00),Time.new(2000,1,1,18,00,00)]]
    i = 0
    until i == timeslots_array.length
      timeslots_array.each do |timeslot|
        draw = rand(1..100)
        if draw > 50
          start_time = timeslot[0]
          end_time = timeslot[1]
          new_timeslot = Timeslot.new(student_id: user2.id, availability_id: teacher_availability.id, start_time: start_time, end_time: end_time, booked: false)
          new_timeslot.save!
        end
        i += 1
      end
    end
  end
end

puts "Availabilities & timeslots created"
