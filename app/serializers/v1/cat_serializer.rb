class CatSerializer < ActiveModel::Serializer
  attribute :id, :name, :breed, :temperament, :weight, :fat?
  has_many :hobbies
end
