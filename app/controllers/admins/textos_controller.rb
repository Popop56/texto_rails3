class Admins::TextosController < ApplicationController
  respond_to :html, :xml, :js
  
  def index
    @textos = Texto.where(["status = ?", 0])
  end
  
  # DELETE /admins/textos/1
  # DELETE /admins/textos/1.xml
  def destroy
    @texto = Texto.find(params[:id])
    @texto.destroy

    respond_with(@texto)
  end
  
  # Approve a texto
  def approve
	    @texto = Texto.find(params[:id])
	    @texto.status = 1
	    
	    if @texto.save
	    	respond_with(@texto)
	    end
  end
  
end
