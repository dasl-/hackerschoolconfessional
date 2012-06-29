class CommentsController < ApplicationController
  def create
    @confession = Confession.find(params[:confession_id])
    @comment = @confession.comments.build(params[:comment])
    
    @comment_count = @confession.comments.count + 1
    @comment_count_html = "<h3 id='reactions-heading'>Reactions (#{@comment_count})</h3>"
    
    if @comment.save
      Pusher['confession-channel'].trigger('new-comment-event', 
        {:confession_id => @comment.confession_id,
        :comment => render_to_string(@comment, locals: {count: @comment_count}),
        :comment_count => @comment_count_html})
        
      @confession.update_attributes(updated_at: Time.now)
      redirect_to "/confessions/#{@confession.id}/##{@confession.comments.count}"
    else
      redirect_to "/confessions/#{@confession.id}/"
    end
  end
end
