class TextosController < ApplicationController
  # Status
  # 0 : Pending validation
  # 1 : Online
  # 2: flagged
 	
	
	respond_to :html, :xml, :js
  
  # GET /textos
  # GET /textos.xml
  def index
    @textos = Texto.paginate :page => params[:page], :order => 'updated_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @textos }
    end
  end

  # GET /textos/1
  # GET /textos/1.xml
  def show
    @texto = Texto.find(params[:id])
    @comments = @texto.comments

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @texto }
    end
  end

  # GET /textos/new
  # GET /textos/new.xml
  def new
    @texto = Texto.new
    0.times { @texto.replies.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @textos }
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
    # Set default values
    @texto.bad = 0
    @texto.good = 0
    @texto.status = 0
    @texto.ip_address = request.remote_ip
        
    # If user is logged in, we add his ID
    if user_signed_in?
      @texto.users_id = current_user.id  
    end

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
  	voted_texto = read_voted_texto # Get all already voted texto
  	
  	if !voted_texto.include?(params[:id])
	    @texto = Texto.find(params[:id])
	    @texto.good += 1
	    
	    if @texto.save
	    	write_voted_texto(params[:id])
	    	respond_with(@texto)
	    end
	end  
  end

  # Vote down
  def vote_down
  	voted_texto = read_voted_texto # Get all already voted texto
  	
  	if !voted_texto.include?(params[:id])
	    @texto = Texto.find(params[:id])
	    @texto.bad += 1
	    
	    if @texto.save
	    	write_voted_texto(params[:id])
	    	respond_with(@texto)
	    end
	end  
  end
  
  # Add to favorite cookies
  def favorite
  	favorited_texto = read_favorited_texto # Get all already voted texto
  	
  	if !favorited_texto.include?(params[:id])
  		@texto = Texto.find(params[:id])
		  write_favorited_texto(params[:id])
	    respond_with(@texto)
	end  
  end
  
  # Add one field for reply
  def add_field
    params.inspect
    #@textos = Array.new(1+1) { Texto.new } # Generate index+1 objects
    #respond_with(@textos)
  end
    
  
  # private
  protected
  
  def write_voted_texto(texto_id)
  	cookies[:voted_texto] = cookies[:voted_texto].to_s.split(',').push(texto_id.to_s).join(',')
  end
  
  def read_voted_texto
  	cookies[:voted_texto].to_s.split(',')
  end

  def write_favorited_texto(texto_id)
  	cookies[:favorited_texto] = cookies[:favorited_texto].to_s.split(',').push(texto_id.to_s).join(',')
  end
  
  def read_favorited_texto
  	cookies[:favorited_texto].to_s.split(',')
  end
  
end
