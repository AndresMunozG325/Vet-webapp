class Client < ApplicationRecord
    has_many :pets, dependent: :destroy

    validates :name, presence: true
    validates :phone, presence: true
    validates :mail, presence: true


    def to_s
        name
    end

    def number_of_pets
        Pet.where(client_id: id).count
    end
end
