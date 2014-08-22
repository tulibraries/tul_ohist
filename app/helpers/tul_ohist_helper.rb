##
#
# Custom views helpers for TUL_OHIST 
#
##

module TulOhistHelper

  ##
  #
  # Custom theming for contact email to output as linkable field
  #
  ##
  def theme_contact_field(field_val)
  	output=link_to("Contact SCRC for audio", "mailto:#{field_val}")
    output.html_safe
  end

  ##
  #
  # Grab photos related to the transcript
  # 
  ##
  def render_photo(master_identifier)
    b = ActiveFedora::Base.where(master_identifier_ssim: master_identifier).to_a
    
    titles = Array.new    
    dates = Array.new
    img = Array.new   
    
    b.each do |b_obj|
      pid=b_obj.id
      pid_fragments = pid.split(":");
      content_model = pid_fragments.first;
      case content_model
        when 'photograph' then object = Photograph.find(pid)
        else nil
      end
      
      if(object)
       intermed_title = object.title.first
       (titles ||= []) << intermed_title

       intermed_date = object.date.first
       (dates ||= []) << intermed_date
       image_url = get_image_url(pid)
       (img ||= []) << image_tag(image_url, :alt => intermed_title)
     end

    end
    
    return img.to_sentence

  end

  def get_image_url(pid)
  	object = Photograph.find(pid)
  	filename = object.contentdm_file_name
    cdm_pointer = object.contentdm_number
    cdm_alias = object.contentdm_collection_id

    image_url = "http://digital.library.temple.edu/utils/getfile/collection/#{cdm_alias}/id/#{cdm_pointer}/filename/#{filename}"

  return image_url

  end

end