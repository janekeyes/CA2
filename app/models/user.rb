class User < ApplicationRecord
    validates :username, :first_name, :last_name, :email, :job_role, presence: true
    validates :date_of_birth, presence: true, on: :create
    validate :age_validation, on: :create
    validates :username, uniqueness: {  case_sensitive: false, message: "This username is unavailable. Please choose another." }

    private 

    def age_validation
        return if date_of_birth.blank?

    age = ((Date.today - date_of_birth) / 365.25).to_i
    if age < 18
      errors.add(:date_of_birth, "Employees cannot be under 18 years of age.")
    elsif age > 70
      errors.add(:date_of_birth, "Employees cannot be over 70 years of age.")
    end
  end

  end
  