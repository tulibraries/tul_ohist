class CompoundObjectsController < ApplicationController
  include Hydra::Controller::ControllerBehavior
  
  helper_method :render_title, :render_blurb, :render_image_grid
  
  def index
  end
  
  def show()
    #get_type(params[:order_id])
  end
  
  def render_title(master_identifier) 
    output = "<h1>Welcome to #{master_identifier}</h1>"
    return output.html_safe
  end
  
  
  
end
