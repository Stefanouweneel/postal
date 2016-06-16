class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.order( created_at: :desc )
  end

  def create
    if @post.save
      redirect_to posts_path
    else
      render posts_path
    end
  end

  def user
    @user = User.find( params[:user_id] )
    authorize! :read, @user

    @posts = Post.where( user: @user ).order( created_at: :desc )
    authorize! :read, @posts

    @likes = @user.likes.joins( :post ).order( "posts.created_at DESC" )
    authorize! :read, @likes
  end

  private

  def post_params
    params.require( :post ).permit( :content )
  end

end
