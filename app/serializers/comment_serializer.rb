class CommentSerializer < ActiveModel::Serializer
 attributes :id, :body, :user_id, :post_id

 has_one :user, except: [:comments, :posts]
 has_one :post, except: [:user, :comments]
end
