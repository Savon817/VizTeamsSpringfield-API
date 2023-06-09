class Team < ApplicationRecord
    
    validates :name, presence: true
    validates :description, presence: true

    has_many :employees
end
