class SiteStylesController < ApplicationController
  def new
    @new_style = SiteStyle.new
  end

  ### Use Fields for to create multiple 'site-styles'

  def edit
  end

  def create
    style = SiteStyle.new(style_params)
    if style.save
      redirect_to root_path
    else
      render :new, notice: "Something went wrong!"
    end  
  end
  
  def updat
  end

  private

  def style_params
    params.require(:site_style).permit(:style_type, :style_color, :photo)
  end  

end
