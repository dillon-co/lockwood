class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end
  
  def create
    blog = Blog.new(blog_params)
    if blog.save
      redirect_to blog_path(blog)
     else
      render :new, notice: :error
    end   
  end

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def blog_params
    params.require(:blog).permit(:video, :title, :body)
  end  
end
