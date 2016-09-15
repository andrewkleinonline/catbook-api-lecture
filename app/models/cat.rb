class Cat < ApplicationRecord
  validates :name, :weight, presence: true

  def fat?

  end
end
