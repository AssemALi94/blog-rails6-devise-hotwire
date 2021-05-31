class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  validates :body, presence: true, allow_blank: false
  broadcasts_to :post

  # after_create_commit -> {broadcast_append_to post}
  # after_destroy_commit -> {broadcast_remove_to post}
  # after_update_commit -> {broadcast_replace_to post}
end
