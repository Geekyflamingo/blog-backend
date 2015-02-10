class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name

  has_many :posts, except: [:user, :comments]
  has_many :comments, except: [:user, :post]
end
