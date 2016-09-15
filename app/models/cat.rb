class Cat < ApplicationRecord
  validates :name, :weight, presence: true
end
