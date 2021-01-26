class Pet < ApplicationRecord
    has_many :pet_histories, dependent: :destroy
    validates :name, presence: true
    validates :breed, presence: true
    validates :birthdate, presence: true
    belongs_to :clients

    def number_of_visits_vet
        PetHistory.where(Pet_id: id).count
    end

    def average_weight
        weight = PetHistory.where(Pet_id: id).pluck(:weight)
        weight.sum / weight.length
    end
    
    def average_height
        height = PetHistory.where(Pet_id: id).pluck(:height)
        height.sum / height.length
    end

    def max_height
        max_height = PetHistory.where(Pet_id: id).pluck(:height)
        max_height.max
    end

    def max_weight
        max_weight = PetHistory.where(Pet_id: id).pluck(:weight)
        max_weight.max
    end
    
end
