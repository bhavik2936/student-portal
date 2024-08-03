class Student < User
  after_update :inform_student_approved, if: :saved_change_to_approved?

  def self.to_csv
    attributes = %w{email first_name last_name date_of_birth address} #customize columns here

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |car|
        csv << attributes.map{ |attr| car.send(attr) }
      end
    end
  end

  def inform_student_registration
    StudentMailer.student_registered(self).deliver
  end

  private

  def inform_student_approved
    StudentMailer.student_approved(email).deliver
  end
end
