class Comment < ActiveRecord::Base
  belongs_to :texto
  belongs_to :user
  
  validates :content,  :presence => true
  validates_presence_of :users_id, :message => "You must be logged in to post a comment!"
end
