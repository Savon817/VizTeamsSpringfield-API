class Employee < ApplicationRecord
    validates :first_name, :last_name, :pictureUrl, presence: true

    belongs_to :job
    belongs_to :team
    
end
