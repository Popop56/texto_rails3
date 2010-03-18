class Profiles::TextosController < ApplicationController
  
  def index
    @textos = Texto.all(:conditions => "status = 1 AND users_id = #{current_user.id}", :order => "created_at DESC")
  end

end
