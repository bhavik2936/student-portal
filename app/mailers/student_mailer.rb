class StudentMailer < ApplicationMailer
  default from: 'student-registration@example.com'
  layout 'mailer'

  def student_approved(email)
    mail(to: email, subject: 'Profile Verified by Admin')
  end

  def student_registered(student)
    @student = student
    mail(to: student.email, subject: 'Profile Created by Admin')
  end

  def daily_greet(student)
    @student = student
    mail(to: student.email, subject: 'Good Morning')
  end

  def birthday_greet(student)
    @student = student
    mail(to: student.email, subject: 'Happy Birthday')
  end
end
