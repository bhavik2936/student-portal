namespace :wish do
  desc "Wish Good Morning to Every Student"
  task daily_greet: :environment do
    Student.find_each do |student|
      StudentMailer.daily_greet(student).deliver
    end
  end

  desc "Send Birthday Greetings to Birthday boy/girl"
  task birthday_greet: :environment do
    Student.where(date_of_birth: Date.today).find_each do  |student|
      StudentMailer.birthday_greet(student).deliver
    end
  end
end
