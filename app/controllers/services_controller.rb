class ServicesController < ApplicationController

  def new
    @service = Service.new
  end
  
  def create
    service = Service.new(service_params)
    if service.save
      redirect_to dashboard_path
    else
      notice :error
    end    
  end

  private

  def service_params
    params.require(:sercive).permit(:title, :description, :hourly_rate)
  end  
end
