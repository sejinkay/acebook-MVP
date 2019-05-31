class Post < ApplicationRecord
  def post
    belongs_to :user, :foreign_key => 'wall_owner_id'
  end
   has_many :comments, dependent: :destroy
end
