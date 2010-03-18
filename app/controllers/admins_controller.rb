class AdminsController < ApplicationController
  before_filter :authenticate_admin!
 
  def index
    @textos = Texto.all(:conditions => "status = 0", :limit => "10", :order => "created_at DESC")
    @users = User.all(:limit => "10", :order => "created_at DESC")
    @comments = Comment.all(:limit => "10", :order => "created_at DESC")
  end
end