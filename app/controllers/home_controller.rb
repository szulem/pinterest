class HomeController < ApplicationController
  def index
    @pins = Pin.all.order("created_at DESC")
  end
  
  def about
  end
  
  def project
  end
end
