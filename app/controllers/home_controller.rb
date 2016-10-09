class HomeController < ApplicationController
  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end
  
  def about
  end
  
  def project
  end
end
