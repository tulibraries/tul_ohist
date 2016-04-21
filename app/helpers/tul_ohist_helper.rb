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
  def render_contact_field(field_val)
  	output=link_to(t('tul_ohist.contact_field.text'), "mailto:#{field_val}")
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

  def render_photo_local(master_identifier)
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
       image_url = get_image_url_local(pid)
       (img ||= []) << image_tag(image_url, :alt => intermed_title)
     end
    end
    return img.to_sentence
  end


  def render_related_resources(master_identifier, document)
  	related_resources_list = ''
    rc_label = content_tag("span", nil, class: "related-resource-label") do t('tul_ohist.related_resources.label.repository_collection') end
    rc_solr_field = render_document_show_field_value(document,'repository_collection_tesim')
    repository_collection_link = content_tag("li") do (rc_label + rc_solr_field).html_safe end
  	related_resources = related_resources(master_identifier)
    related_resources_list << render_single_list(related_resources)

    related_resources_list.prepend(repository_collection_link)
    return content_tag("ul") do related_resources_list.html_safe end
  end

  ##
  #
  # Grab all related resources (links) for the transcript
  # 
  ##
  def related_resources(master_identifier)
    b = get_related_objects(master_identifier);
    related_resources = Array.new
    b.each do |b_obj|
      pid=b_obj.id
      object = locate_by_model(pid)
      if(object)
       finding_aid = [object.finding_aid_link.first,object.finding_aid_title.first,t('tul_ohist.related_resources.label.finding_aid')]
       online_exhibit = [object.online_exhibit_link.first,object.online_exhibit_title.first, t('tul_ohist.related_resources.label.online_exhibit')]
       catalog_record = [object.catalog_record_link.first,object.catalog_record_title.first, t('tul_ohist.related_resources.label.catalog_record')]
       (related_resources ||= []) << finding_aid << online_exhibit << catalog_record
     end
    end
    return related_resources
  end

  def render_single_list(links_list)
    html_list = ''
      for list_items in links_list do
        unless list_items.first.nil? or list_items.first.empty?
          html_list << content_tag("li") do
          link_text = link_to "#{list_items.second}", "#{list_items.first}" 
          label = content_tag("span", nil, class: "related-resource-label") do "#{list_items.third}" end
          concat (label + link_text).html_safe
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
    image_url = contentdm_image_asset_url(cdm_alias, cdm_pointer);
    return image_url
  end

  def get_image_url_local(pid)
    object = Photograph.find(pid)
    mid = object.master_identifier
    image_url = local_image_asset_url(mid)
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

  def contentdm_image_asset_url(collection, pointer)
    config = YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__))
    "#{config['cdm_archive']}/utils/ajaxhelper/?CISOROOT=#{collection}&CISOPTR=#{pointer}&action=2&DMSCALE=10&DMWIDTH=2000&DMHEIGHT=2000"
  end

  def local_image_asset_url(mid)
    "https://libdigital.temple.edu/pdfa1/Oral Histories/#{mid.to_sentence}.jpg"
  end

  def local_file_url(mid)
    "https://libdigital.temple.edu/pdfa1/Oral Histories/#{mid.to_sentence}Q01.pdf"
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

  def render_google_analytics
    analytics_init if (Rails.env.production? and GoogleAnalytics.valid_tracker?)
  end

end

