class Employee < ApplicationRecord
    validates :first_name, :last_name, presence: true

    has_one :job_title
    
end
