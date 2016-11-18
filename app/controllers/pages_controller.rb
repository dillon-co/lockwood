class PagesController < ApplicationController
  def home
    @tags = Tag.all.map { |t| t.name }.uniq
    @blogs = Blog.includes(:tags).all.reverse
  end

  def about
  end

  def contact
  end
end
