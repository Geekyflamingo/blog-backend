class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body

  has_one :user, except: [:posts, :commments]
  has_one :post
end
