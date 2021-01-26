class Pet < ApplicationRecord
    has_many :pet_histories, dependent: :destroy
    validates :name, presence: true
    validates :breed, presence: true
    validates :birthdate, presence: true
     
end
