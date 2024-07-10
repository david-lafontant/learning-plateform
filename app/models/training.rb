class Training < ApplicationRecord
    validates :name, :description, :credit, presence: true
    validates :name, length: {in: 8..40}, uniqueness: true
    validates :description, length: {in: 30..300}
    validates :credit, numericality: { only_integer: true , greater_than_or_equal_to: 0 }
end
