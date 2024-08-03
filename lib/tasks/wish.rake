namespace :wish do
  desc "Wish Good Morning to Every Student"
  task daily_greet: :environment do
    Student.find_each do |student|
      StudentMailer.daily_greet(student).deliver
    end
  end
end
