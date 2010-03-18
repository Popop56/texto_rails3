class ProfilesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    @user = current_user
    @textos = Texto.all(:conditions => "status = 1 AND users_id = #{current_user.id}", :order => "created_at DESC", :limit => 5)
  end
  
end
