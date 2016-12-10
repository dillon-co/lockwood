class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_common_objects

  def get_common_objects
    @all_tags = Tag.all.map { |t| t.name }.uniq
    @blogs = Blog.includes(:tags).all.order('created_at DESC')
  end  
end
