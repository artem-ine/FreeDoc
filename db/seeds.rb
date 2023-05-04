require 'faker'


JoinDoctorSpecialty.destroy_all
Doctor.destroy_all
Specialty.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all


5.times do |index|
  city = City.create(city: Faker::Address.city)
end


specs = []
5.times do |index|
  spec = Specialty.create(specialty: ['Ophtalmologist', 'Oncologist', 'Psychiatrist', 'Dermatologist', 'GP'].sample)
  specs << spec
end


doctors = []
10.times do |index|
  city = City.order("RANDOM()").first
  specialty = Specialty.order("RANDOM()").first
  doctor = Doctor.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, zip_code: Faker::Address.zip_code, city_id: city.id)
  doctors << doctor
end 


doctors.each do |doctor|
  specs.sample(3).each do |spec|
    JoinDoctorSpecialty.create(doctor_id: doctor.id, specialty_id: spec.id)
  end
end


25.times do |index|
  city = City.order("RANDOM()").first
  patient = Patient.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, city_id: city.id)
end 


50.times do |index|
  doctor = Doctor.order("RANDOM()").first
  patient = Patient.order("RANDOM()").first
  city = City.order("RANDOM()").first
  appointment = Appointment.create(date: Faker::Date.forward(days: 250), doctor: doctor, patient: patient, city_id: city.id)
end