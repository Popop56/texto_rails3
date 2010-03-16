class Texto < ActiveRecord::Base
  has_many  :comments, :dependent => :destroy
  has_many  :replies, :dependent => :destroy
  belongs_to :user
  
  validates :content,  :presence => true
  validates :ip_address,  :presence => true
  
  accepts_nested_attributes_for :replies, :allow_destroy => true
  self.per_page = 15
end
