class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    # @prototype = Prototype.all
    if @comment.save
      redirect_to prototype_path(@comment.prototype) 
    else
      @prototype = Prototype.find(params[:prototype_id])
      @comment = Comment.new
      @comments = @prototype.comments.includes(:user)
      render "prototypes/show" 
      # rendeで失敗した時に、showのビューを表示させるために必要なインスタンス変数を用意する
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end

end
