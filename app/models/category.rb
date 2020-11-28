class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :description, presence: false

    has_many :tasks #, dependent: :destroy
end
