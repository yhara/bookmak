class BookmarkletsController < ApplicationController
  layout "default"

  before_filter :login_required, :only => [:import, :remove]

  # GET /bookmarklets
  # GET /bookmarklets.xml
  def index
    @bookmarklets = Bookmarklet.find(:all)
    if logged_in?
      @user_bookmarkltes = current_user.bookmarklets
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookmarklets }
    end
  end

  # GET /bookmarklets/1
  # GET /bookmarklets/1.xml
  def show
    @bookmarklet = Bookmarklet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookmarklet }
    end
  end

  # GET /bookmarklets/new
  # GET /bookmarklets/new.xml
  def new
    @bookmarklet = Bookmarklet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmarklet }
    end
  end

  # GET /bookmarklets/1/edit
  def edit
    @bookmarklet = Bookmarklet.find(params[:id])
  end

  # POST /bookmarklets
  # POST /bookmarklets.xml
  def create
    @bookmarklet = Bookmarklet.new(params[:bookmarklet])
    @bookmarklet.author = current_user

    respond_to do |format|
      if @bookmarklet.save
        flash[:notice] = 'Bookmarklet was successfully created.'
        format.html { redirect_to(@bookmarklet) }
        format.xml  { render :xml => @bookmarklet, :status => :created, :location => @bookmarklet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookmarklet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarklets/1
  # PUT /bookmarklets/1.xml
  def update
    @bookmarklet = Bookmarklet.find(params[:id])

    respond_to do |format|
      if @bookmarklet.update_attributes(params[:bookmarklet])
        flash[:notice] = 'Bookmarklet was successfully updated.'
        format.html { redirect_to(@bookmarklet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookmarklet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarklets/1
  # DELETE /bookmarklets/1.xml
  def destroy
    @bookmarklet = Bookmarklet.find(params[:id])
    @bookmarklet.destroy

    respond_to do |format|
      format.html { redirect_to(bookmarklets_url) }
      format.xml  { head :ok }
    end
  end

  # GET /bookmarklets/import/1
  def import
    @bookmarklet = Bookmarklet.find(params[:id])
    if @bookmarklet
      title = @bookmarklet.title
      if current_user.bookmarklets.include?(@bookmarklet)
        flash[:notice] = "You already have the bookmarklet '#{title}'."
      else
        current_user.bookmarklets << @bookmarklet
        #flash[:notice] = "Successfully imported bookmarklet '#{title}'."
      end
    else
      flash[:notice] = "Bookmarklet ##{params[:id]} not found."
    end
    redirect_to :action => 'index'
  end

  def remove
  end
end
