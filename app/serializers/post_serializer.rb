class PostSerializer < ActiveModel::Serializer
 attributes :id, :title, :body, :user_id
 has_one :user, except: [:posts, :comments]
 has_many :comments, except: [:user, :posts]
end
