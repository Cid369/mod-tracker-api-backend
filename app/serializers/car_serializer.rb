class CarSerializer < ActiveModel::Serializer
  attributes :id, :year, :make, :model
end
