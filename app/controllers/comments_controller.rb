class CommentsController < ApplicationController
load_and_authorize_resource 
skip_authorize_resource :only => [:index, :show]

# create a new comment for product
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comments = @product.comments.all.order("created_at DESC")
    @comments = @comments.paginate(:page => params[:page], :per_page =>5)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @product, alert: 'Review was not successfully saved.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

# destroy comment (admin only)
  def destroy
    @comment = Comment.find params[:id]
    authorize! :destroy, @comment # cancancan command, that will raise exception if current user is
                                  # not authorized to destroy the particular. 
    product = @comment.product
    @comment.destroy
    redirect_to product_url id: params[:product_id]
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end
  
end