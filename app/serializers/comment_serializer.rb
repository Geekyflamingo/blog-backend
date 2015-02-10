class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body

  has_one :post, except: [:comments, :body, :title]
  has_one :user, except: [:first_name, :last_name, :posts, :comments]
end
