class Job < ApplicationRecord
    validates :job_titles, presence: true
end
