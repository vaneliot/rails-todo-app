class Task < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: false
end
