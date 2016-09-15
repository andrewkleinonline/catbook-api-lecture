class Cat < ApplicationRecord
  validates :name, :weight, presence: true

  def fat?
    weight >= 10
  end
end
