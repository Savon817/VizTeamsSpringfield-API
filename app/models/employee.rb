class Employee < ApplicationRecord
    validates :first_name, :last_name

    has_one :job_title
    
end
