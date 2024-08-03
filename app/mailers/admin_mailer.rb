class AdminMailer < Devise::Mailer
  default from: 'student-registration@example.com'
  layout 'mailer'

  def new_student_registered(email)
    @email = email
    mail(to: Admin.pluck(:email), subject: 'New Student Registered')
  end
end
