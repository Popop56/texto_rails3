class Admins::TextoController < ApplicationController
  def index
    @textos = Texto.where(["status = ?", 0])
  end
  
end
