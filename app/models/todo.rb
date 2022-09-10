class Todo < ApplicationRecord
    belongs_to :user
    has_many :comments
    
    validates :title, presence: true, length: {minimum: 6, maximum: 30}
    validates :description, presence: true, length: {minimum: 10, maximum:500}
end