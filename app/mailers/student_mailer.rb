class StudentMailer < ApplicationMailer
  default from: 'student-registration@example.com'
  layout 'mailer'

  def student_approved(email)
    mail(to: email, subject: 'Profile Verified by Admin')
  end
end
