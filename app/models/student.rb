class Student < User
  after_update :inform_student_approved, if: :saved_change_to_approved?

  private

  def inform_student_approved
    StudentMailer.student_approved(email).deliver
  end
end
