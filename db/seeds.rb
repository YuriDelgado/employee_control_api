def create_attendance user, check_in, check_out, check_out_type
    attendance = user.attendances.create!
    attendance.created_at = check_in
    attendance.updated_at = check_out
    attendance.status = check_out_type
    attendance.save
end

admin = User.create!(
  name: 'Yuri Delgado',
  email: 'yuri@test.com',
  password: '123qwe', 
  password_confirmation: '123qwe'
)

30.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123qwe', 
    password_confirmation: '123qwe',
    admin_id: admin.id,
  )
  user.created_at = DateTime.now - 8.days
  
  7.times do |number|
    check_out = nil
    check_in = (Date.today - number.days) + rand(520..580).minutes
    lunch_time = check_in + 4.hours
    if [true, false].sample
      check_out = check_in + rand(50..120).minutes
      create_attendance user, check_in, check_out, Attendance.statuses.except(:check_in, :check_out, :lunch).keys.sample
      check_in = check_out + rand(30..90).minutes
    end
    create_attendance user, check_in, lunch_time, :lunch
    check_in = lunch_time + rand(50..70).minutes
    if [true, false].sample
      check_out = check_in + rand(50..120).minutes
      create_attendance user, check_in, check_out, Attendance.statuses.except(:check_in, :check_out, :lunch).keys.sample
      check_in = check_out + rand(40..120).minutes
    end
    create_attendance user, check_in, check_in + rand(60..300).minutes, :check_out
  end
end
