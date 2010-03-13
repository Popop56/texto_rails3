class Texto < ActiveRecord::Base
  has_many  :comments
  self.per_page = 15
end
