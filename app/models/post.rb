class Post < ApplicationRecord

  mount_uploader :photo, PhotoUploader


  def post
    belongs_to :user, :foreign_key => 'wall_owner_id'
  end
end
