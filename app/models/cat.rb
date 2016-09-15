class Cat < ApplicationRecord
  has_many :cat_hobbies
  has_many :hobbies, through: :cat_hobbies
  
  validates :name, :weight, presence: true

  def fat?
    weight >= 10
  end
end
