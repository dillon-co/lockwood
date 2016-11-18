# require 'will_paginate/array'

class TagsController < ApplicationController

  def index
    @tags = Tag.all.map { |t| t.name }.uniq
  end  

  def show
    @tag_name = params[:id]
    blogs = Blog.includes(:tags).where('tags.name = ?', @tag_name).references(:tags)
    @blogs = blogs.reverse.paginate(:page => params[:page], :per_page => 9) ## << order by newest first then paginate, 9 blogs per page
    @tags = Tag.all.map { |t| t.name }.uniq
  end
    
end
