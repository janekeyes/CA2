class User < ApplicationRecord
    validates :username, :first_name, :last_name, :email, :job_role, presence: true
    validates :date_of_birth, presence: true, on: :create
  end
  