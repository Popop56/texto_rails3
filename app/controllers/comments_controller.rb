class CommentsController < ApplicationController
  respond_to :html, :xml, :js
  
  # GET /comments
  # GET /comments.xml
  def index
    @texto = Texto.find(params[:texto_id])
    @comments = @texto.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @texto = Texto.find(params[:texto_id])
    @comment = @texto.comments.create(params[:comment])
    @comment.ip = request.remote_ip
    # If user is logged in, we add his ID
    if user_signed_in?
      @comment.users_id = current_user.id  
    end
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@texto, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
        format.js   { respond_with(@comment) }  
      else
        logger.debug("here fuckER")
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  
end
