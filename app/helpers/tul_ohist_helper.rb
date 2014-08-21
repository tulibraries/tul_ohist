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

  def contentdm_file_url(collection, pointer, name)
    config = YAML.load_file(File.expand_path("#{Rails.root}/config/contentdm.yml", __FILE__))
    "#{config['cdm_archive']}/utils/getfile/collection/#{collection}/id/#{pointer}/filename/#{name}"
  end

end
