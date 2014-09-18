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
  	output=link_to(t('tul_ohist.contact_text'), "mailto:#{field_val}")
    output.html_safe
  end

  ##
  #
  # Grab photos related to the transcript
  # 
  ##
  def render_photo(master_identifier)
    b = get_related_objects(master_identifier);
    titles = Array.new    
    dates = Array.new
    img = Array.new   
    
    b.each do |b_obj|
      pid=b_obj.id
      object = locate_by_model(pid)
      if(object && object.type.first == "Photograph")
       intermed_title = object.title.first
       (titles ||= []) << intermed_title
       image_url = get_image_url(pid)
       (img ||= []) << image_tag(image_url, :alt => intermed_title)
     end
    end
    return img.to_sentence
  end

  def render_related_items(master_identifier)
  	related_items_list = ''
  	related_items = related_items(master_identifier)
    related_items_list << render_single_list(related_items)

    return content_tag("ul") do related_items_list.html_safe end
  end

  ##
  #
  # Grab all related items (links) for the transcript
  # 
  ##
  def related_items(master_identifier)
    b = get_related_objects(master_identifier);

    related_items = Array.new
 
    
    b.each do |b_obj|
      pid=b_obj.id
      object = locate_by_model(pid)
      if(object)
       finding_aid = [object.finding_aid_link.first,object.finding_aid_title.first]
       online_exhibit = [object.online_exhibit_link.first,object.online_exhibit_title.first]
       catalog_record = [object.catalog_record_link.first,object.catalog_record_title.first]
       (related_items ||= []) << finding_aid << online_exhibit << catalog_record
     end
    end
    binding.pry
    return related_items
  end

  def render_single_list(links_list)
    html_list = ''
      for list_items in links_list do
        unless list_items.first.empty?
          html_list << content_tag("li") do
          concat link_to "#{list_items.second}", "#{list_items.first}" 
         end
        end
      end
      return html_list.html_safe
    end



  def get_image_url(pid)
  	object = Photograph.find(pid)
  	filename = object.contentdm_file_name
    cdm_pointer = object.contentdm_number
    cdm_alias = object.contentdm_collection_id
    image_url = contentdm_file_url(cdm_alias, cdm_pointer, filename);
    return image_url
  end


  def get_related_objects(master_identifier)
    related_objects = ActiveFedora::Base.where(master_identifier_ssim: master_identifier).to_a
    return related_objects
  end

  def contentdm_file_url(collection, pointer, name)
    config = YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__))
    "#{config['cdm_archive']}/utils/getfile/collection/#{collection}/id/#{pointer}/filename/#{name}"
  end

  def locate_by_model(pid)
    pid_fragments = pid.split(":");
    content_model = pid_fragments.first;
    case content_model
      when 'photograph' then object = Photograph.find(pid)
      when 'transcript' then object = Transcript.find(pid)
        else nil
      end
  end

end

