class Admins::TextosController < ApplicationController
  respond_to :html, :xml, :js
  
  def index
    @textos = Texto.all(:conditions => "status = 0", :order => "created_at DESC")
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
