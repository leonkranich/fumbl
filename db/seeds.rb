require "date"
require "time"
require "nokogiri"
require 'faker'
require "pry-byebug"

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


# #------ End-User seed -------


email2 = "host2@test.de"
password2 = "host123456"
password_confirmation2 = "host123456"
first_name2 = "Kenny"
last_name2 = "McCormick"
address2 = "Warschauer Straße 55, 10243 Berlin"
teacher2 = false
photo_url = "https://randomuser.me/api/portraits/men/32.jpg"
# user2.photo.attach(io: photo2, filename: 'user2.png', content_type: 'image/jpg')
# user2.save!

user2 = User.create(email: email2, password: password2, password_confirmation: password_confirmation2, first_name: first_name2, last_name: last_name2, address: address2, teacher: teacher2, photo_url: photo_url)


i = 5
until i == 10
  email = "host#{i}@test.de"
  password = "host123456"
  password_confirmation = "host123456"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  address = "Warschauer Straße 55, 10243 Berlin"
  teacher = false
  photo_url = "https://randomuser.me/api/portraits/men/32.jpg"

  user = User.create(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name, teacher: teacher, photo_url: photo_url, address: address)
  i += 1
end



# ------ Teachers seed ------

addresses_array = []
url = "https://www.dasoertliche.de/?kgs=11000000&choose=true&page=0&context=0&action=43&buc=2239&topKw=0&form_name=search_nat&kw=supermarkt&ci=Berlin"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('address').each do |element|
  addresses_array << element.text.strip
end

url = "https://www.dasoertliche.de/?wntHit=3&kw=apotheke&form_name=search_nat&ci=Berlin&context=11&page=78&action=56&kgs=11000000&radius=5&buc=2239&orderby=name&ttforderby=rel&recFrom=76"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search('address').each do |element|
  addresses_array << element.text.strip
end

description_array = ["I really enjoy sharing my experience with others. Looking forward to meeting you!", "Just a musician passionate about teaching and sharing knowledge.", "Really looking forward to meeting you!", "Let's discuss how I can help you getting better", "I'm a music geek always looking for ambitious students."]

photo_array = FacesApi.fetch_faces(25, "male")
photo_array.each_with_index do |user_photo, index|

  email = Faker::Internet.email
  password = "host123456"
  password_confirmation = "host123456"
  first_name = Faker::Name.male_first_name
  last_name = Faker::Name.last_name
  address = addresses_array[index]
  teacher = true
  price_per_hour = [30, 35, 40, 45, 50].sample
  photo_url = user_photo["photo"]
  description = description_array.sample

  user = User.create(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name, address: address, teacher: teacher, price_per_hour: price_per_hour, description: description, photo_url: photo_url)

end

photo_array = FacesApi.fetch_faces(25, "female")
photo_array.each_with_index do |user_photo, index|

  email = Faker::Internet.email
  password = "host123456"
  password_confirmation = "host123456"
  first_name = Faker::Name.female_first_name
  last_name = Faker::Name.last_name
  address = addresses_array[index]
  teacher = true
  price_per_hour = [30, 35, 40, 45, 50].sample
  photo_url = user_photo["photo"]
  description = description_array.sample

  user = User.create(email: email, password: password, password_confirmation: password_confirmation, first_name: first_name, last_name: last_name, address: address, teacher: teacher, price_per_hour: price_per_hour, description: description, photo_url: photo_url)

end

puts "Users created"


# #------- Instrument seed --------

User.all.where(teacher: true).each do |teacher|
  instrument_array = ["Violin", "Viola", "Cello", "Doublebass", "Flute", "Oboe", "Clarinette", "Bassoon", "Trumpet", "Horn", "Trombone", "Trumpet", "Piano", "Organ", "Guitar", "Bass", "Drums", "Other"]
  instrument = instrument_array.sample
  experience_array = ["Have played the #{instrument} for a quite some time", "Started playing the #{instrument} years ago", "Gained some experience playing in concerts which I am happy to share", "Started playing the #{instrument} as a child but just recently picked up teaching"]
  instrument = Instrument.create(name: instrument_array.sample, experience: experience_array.sample, years_of_experience: rand(5..30), user_id: teacher.id)
end

puts "Instruments created"


# # #------- Genre seed --------


User.all.where(teacher: true).each do |teacher|
  genre = Genre.create(name: Faker::Music.genre, user_id: teacher.id)
end

puts "Genres created"


# ------- Availability & Timeslots seeds --------


teachers_array = User.where(teacher: true)
teachers_array.each do |teacher|
  (Date.today..Date.today + 14).to_a.each do |day|
    teacher_availability = Availability.create(teacher_id: teacher.id, day: day)
    # start_time = Time.new(teacher_availability.day.year, teacher_availability.day.month, teacher_availability.day.day,9,00,00)
    timeslots_array = [[DateTime.new(day.year,day.month,day.day,9,00,00),DateTime.new(day.year,day.month,day.day,10,00,00)], [DateTime.new(day.year,day.month,day.day,10,00,00),DateTime.new(day.year,day.month,day.day,11,00,00)], [DateTime.new(day.year,day.month,day.day,11,00,00),DateTime.new(day.year,day.month,day.day,12,00,00)], [DateTime.new(day.year,day.month,day.day,13,00,00),DateTime.new(day.year,day.month,day.day,14,00,00)], [DateTime.new(day.year,day.month,day.day,14,00,00),DateTime.new(day.year,day.month,day.day,15,00,00)], [DateTime.new(day.year,day.month,day.day,15,00,00),DateTime.new(day.year,day.month,day.day,16,00,00)], [DateTime.new(day.year,day.month,day.day,16,00,00),DateTime.new(day.year,day.month,day.day,17,00,00)], [DateTime.new(day.year,day.month,day.day,17,00,00),DateTime.new(day.year,day.month,day.day,18,00,00)]]
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
binding.pry

# #------- Review seed --------


def get_random_number_unique(new_array)
  sample = new_array.sample
  deleted_number = new_array.delete(sample)
  [sample, new_array]
end


review_counter = [1, 2, 3, 4, 5]
review_student = User.all.where(teacher: false).sample
User.all.where(teacher: true).each do |teacher|
  content_array = [ "#{teacher.first_name} is one hell of a teacher!!! I am so happy that I found him. Thank you FUMBL!",
  "Great teacher. Could not be happier!", "Despite the short time I have already learned a lot! Amazing teacher!",
  "Very inspiring teacher. We had a few very nice jam sessions 🤙",
  "#{teacher.first_name} is super cool! I really enjoy our weekly sessions.",
  "Not just a great teacher but also a great person in general. His skills are unmatched." ]
  new_array = (1..content_array.length).to_a
  review_counter.sample.times do
    get_random_number_unique_answer = get_random_number_unique(new_array)
    random_number = get_random_number_unique_answer[0]
    new_array = get_random_number_unique_answer[1]
    content = content_array[random_number]
    review = Review.create(content: content, teacher_id: teacher.id, student_id: review_student.id)
  end
end



puts "Reviews created"


# # #------- Voucher seed --------


# counter1 = 5
# price_cents1 = 200
# teacher_id1 = user1.id
# student_id1 = user2.id

# voucher1 = Voucher.new(counter: counter1, teacher_id: teacher_id1, student_id: student_id1, price_cents: price_cents1)
# voucher1.save



# ------- Homework seed --------

timeslot1 = Timeslot.first
timeslot1.booked = true
timeslot1.save
description1 = "Have a look at the music sheets. We will cover them in together in class"
homework1 = Homework.create(timeslot_id: timeslot1.id, description: description1)


