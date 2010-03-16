class AdminsController < ApplicationController
  before_filter :authenticate_admin!
 
  def index
    @textos = Texto.where(["status = ?", 0])
    @admins = Admin.all
  end
end