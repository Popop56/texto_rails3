class Reply < ActiveRecord::Base
  belongs_to :texto
  validates :content,  :presence => true
end
