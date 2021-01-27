class Pet < ApplicationRecord
    belongs_to :client
    has_many :pet_histories, dependent: :destroy
    validates :name, presence: true
    validates :breed, presence: true
    validates :birthdate, presence: true

    def get_client_name
        self.client.name
    end

    def number_of_visits_vet
        PetHistory.where(Pet_id: id).count
    end

    def average_weight
        weight = PetHistory.where(Pet_id: id).pluck(:weight)
        if weight.size == 0
            "This pet don't have histories"
        else
            weight.sum / weight.length
        end
    end
    
    def average_height
        height = PetHistory.where(Pet_id: id).pluck(:height)
        if height.size == 0
            "This pet don't have histories"
        else
            height.sum / height.length
        end
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
