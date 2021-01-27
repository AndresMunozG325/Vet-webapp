class PetHistory < ApplicationRecord
  belongs_to :Pet

  validates :weight, presence: true
  validates :height, presence: true
  validates :description, presence: true


  def get_pet_name
    self.pet.name
  end
end
