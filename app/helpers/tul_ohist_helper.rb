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

end