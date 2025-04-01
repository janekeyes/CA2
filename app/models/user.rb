class User < ApplicationRecord
    validates :username, :first_name, :last_name, :email, :job_role, presence: true
    validates :date_of_birth, presence: true, on: :create
    validate :age_validation, on: :create
    validates :username, uniqueness: {  case_sensitive: false, message: "This username is unavailable. Please choose another." },
    length: { in: 8..16, message: "Username must be between 8 and 16 characters long." },
    format: { with: /\A[a-zA-Z0-9]+\z/, message: "Username can only contain letters and numbers." }

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
  