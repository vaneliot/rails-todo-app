class Task < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: false

    belongs_to :category
end
