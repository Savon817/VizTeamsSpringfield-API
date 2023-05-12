class Job < ApplicationRecord
    validates :job_titles, presence: true

    has_many :employees
end
