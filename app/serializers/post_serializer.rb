class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body

  has_one :user, except: [:posts, :commments]
  has_many :comments, except: [:user]
end
