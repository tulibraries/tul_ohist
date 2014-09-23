class CompoundObjectsController < ApplicationController
  include Hydra::Controller::ControllerBehavior
  
  helper_method :render_title, :render_objects
  
  def index
  end
  
  def show()
    #get_type(params[:order_id])
  end
  
  def render_title(master_identifier) 
    output = "<h1>Welcome to #{master_identifier}</h1>"
    return output.html_safe
  end

  def render_objects(master_identifier)
    b = ActiveFedora::Base.where(master_identifier_ssim: master_identifier).to_a
    
    titles = Array.new    
    dates = Array.new    
    
    b.each do |b_obj|
      pid=b_obj.id
      pid_fragments = pid.split(":");
      content_model = pid_fragments.first;
      case content_model
        when 'photograph' then object = Photograph.find(pid)
        when 'transcript' then object = Transcript.find(pid)
        else nil
      end
      
      if(object)
       intermed_title = object.title.first
       (titles ||= []) << intermed_title

       intermed_date = object.date.first
       (dates ||= []) << intermed_date
      end
    end
    return titles
  end

end
