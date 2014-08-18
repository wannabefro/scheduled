class TaskSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name

  has_one :user
end
