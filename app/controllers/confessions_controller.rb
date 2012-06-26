class ConfessionsController < ApplicationController
  # GET /confessions
  # GET /confessions.json
  def index
    @confessions = Confession.paginate(page: params[:page], per_page: 10, order: "updated_at DESC")
    @confession = Confession.new(params[:confession])
    if session[:uuid].blank?
      @session = Session.create
      @session.last_seen_at =  Time.new
      @session.save
      session[:uuid] = @session.id
    else
      @session = Session.find_by_id(session[:uuid])
      @session.last_seen_at = Time.new
      @session.save
    end
    
    @session_count = Session.find(:all, conditions: ['last_seen_at > ?', 5.minutes.ago]).count
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @confessions }
    end
  end

  # GET /confessions/1
  # GET /confessions/1.json
  def show
    @confession = Confession.find(params[:id])
    @comments = @confession.comments
    @comment = Comment.new(params[:confession])
    
    if session[:uuid].blank?
      @session = Session.create
      @session.last_seen_at =  Time.new
      @session.save
      session[:uuid] = @session.id
    else
      @session = Session.find_by_id(session[:uuid])
      @session.last_seen_at = Time.new
      @session.save
    end
    
    @session_count = Session.find(:all, conditions: ['last_seen_at > ?', 5.minutes.ago]).count
    
    @sessions = Session.count
  end

  # GET /confessions/new
  # GET /confessions/new.json
  def new
    @confession = Confession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @confession }
    end
  end

  # GET /confessions/1/edit
  def edit
    @confession = Confession.find(params[:id])
  end

  # POST /confessions
  # POST /confessions.json
  def create
    @confession = Confession.new(params[:confession])
    @confessions = Confession.paginate(page: params[:page], per_page: 10, order: "created_at DESC")

    if @confession.save
      flash[:success] = "Confession commiserated!"
      redirect_to root_path
    else
      render "index"
    end
  end

  # PUT /confessions/1
  # PUT /confessions/1.json
  def update
    @confession = Confession.find(params[:id])

    respond_to do |format|
      if @confession.update_attributes(params[:confession])
        format.html { redirect_to @confession, notice: 'Confession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confessions/1
  # DELETE /confessions/1.json
  def destroy
    @confession = Confession.find(params[:id])
    @confession.destroy

    respond_to do |format|
      format.html { redirect_to confessions_url }
      format.json { head :no_content }
    end
  end
end
