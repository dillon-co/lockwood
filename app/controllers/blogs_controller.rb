class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end
  
  def create
    blog = Blog.new(blog_params)
    blog_tags = params["tags"].split(', ').map { |t| {name: t.downcase} }
    if blog.save
      blog.tags.create(blog_tags)
      redirect_to blog_path(blog)
     else
      render :new, notice: :error
    end   
  end

  def index
    @blogs = Blog.all.reverse.paginate(page: params[:page], per_page: 9)
    @tags = Tag.all.map { |t| t.name }.uniq
  end

  def show
    @blog = Blog.includes(:tags).find(params[:id])
    @tags = @blog.tags
    @video_link = @blog.video_link
  end

  private

  def blog_params
    params.require(:blog).permit(:video, :title, :body, :photo)
  end  
end
