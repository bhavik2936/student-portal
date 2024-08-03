module UserHelper
  extend ActiveSupport::Concern

  included do
    TYPE_ADMIN = 'Admin'.freeze
    TYPE_STUDENT = 'Student'.freeze

    def admin?
      type == TYPE_ADMIN
    end

    def student?
      type == TYPE_STUDENT
    end

    def full_name
      "#{first_name} #{last_name}"
    end
  end
end
