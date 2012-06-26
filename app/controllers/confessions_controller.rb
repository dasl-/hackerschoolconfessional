class ConfessionsController < ApplicationController
  before_filter :get_session, only: [:index, :show, :create]
  
  # GET /confessions
  # GET /confessions.json
  def index
    @confessions = Confession.paginate(page: params[:page], per_page: 10, order: "updated_at DESC")
    @confession = Confession.new(params[:confession])
    
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
  
  private
    def get_session
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
    end
    
end
