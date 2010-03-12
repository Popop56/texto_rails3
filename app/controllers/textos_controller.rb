class TextosController < ApplicationController
  respond_to :html, :xml, :js
  
  # GET /textos
  # GET /textos.xml
  def index
    @textos = Texto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @textos }
    end
  end

  # GET /textos/1
  # GET /textos/1.xml
  def show
    @texto = Texto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @texto }
    end
  end

  # GET /textos/new
  # GET /textos/new.xml
  def new
    @texto = Texto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @texto }
    end
  end

  # GET /textos/1/edit
  def edit
    @texto = Texto.find(params[:id])
  end

  # POST /textos
  # POST /textos.xml
  def create
    @texto = Texto.new(params[:texto])

    respond_to do |format|
      if @texto.save
        format.html { redirect_to(@texto, :notice => 'Texto was successfully created.') }
        format.xml  { render :xml => @texto, :status => :created, :location => @texto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @texto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /textos/1
  # PUT /textos/1.xml
  def update
    @texto = Texto.find(params[:id])

    respond_to do |format|
      if @texto.update_attributes(params[:texto])
        format.html { redirect_to(@texto, :notice => 'Texto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @texto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /textos/1
  # DELETE /textos/1.xml
  def destroy
    @texto = Texto.find(params[:id])
    @texto.destroy

    respond_to do |format|
      format.html { redirect_to(textos_url) }
      format.xml  { head :ok }
    end
  end
  
  # Vote up
  def vote_up
    @texto = Texto.find(params[:id])
    @texto.good += 1
    
    if @texto.save
      respond_with(@texto)
    end  
  end
  
  
end
