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
    blog_id = params[:id]
    @blog = Blog.includes(:tags).find(blog_id)
    @tags = @blog.tags.map{|t| t.name }
    @r_blogs = @tags.map do |t| 
      Blog.includes(:tags).where('tags.name = ? and blogs.id != ?', t, blog_id).references(:tags).map { |bl| bl }
    end
    @r_blogs.flatten!.uniq!
    @related_blogs = @r_blogs.first(4)
    # @r_blogs.uniq!

    @video_link = @blog.video_link
  end

  private

  def blog_params
    params.require(:blog).permit(:video, :title, :body, :photo)
  end  
end
