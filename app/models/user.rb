class User < ApplicationRecord
    validates :username, :first_name, :last_name, :email, :date_of_birth, :job_role, presence: true

end
