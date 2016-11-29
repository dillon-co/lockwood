class PagesController < ApplicationController
  def home
    @tags = Tag.all.map { |t| t.name }.uniq
    @blogs = Blog.includes(:tags).all.order('created_at DESC')
  end

  def about
  end

  def contact
  end
end
