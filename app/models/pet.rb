class Pet < ApplicationRecord
    has_many :pet_histories, dependent: :destroy
    validates :name, presence: true
    validates :breed, presence: true
    validates :birthdate, presence: true
     

    def number_of_visits_vet
        Pet_history.where(Pet_id: id).count
    end
end
