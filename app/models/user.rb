class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include UserHelper

  before_validation :set_user_type
  after_create :inform_admin

  # Allow Login only if approved to access the platform
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  private

  def set_user_type
    self.type = TYPE_STUDENT unless type
  end

  def inform_admin
    return if approved?

    AdminMailer.new_student_registered(email).deliver
  end
end
