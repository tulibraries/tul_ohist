require 'deprecation'
module Blacklight::UrlHelperBehavior
	extend Deprecation
	self.deprecation_horizon = 'blacklight 6.0'

	def link_to_document(doc, opts={:label=>nil, :counter => nil, :linkClass => nil})
		opts[:label] ||= document_show_link_field(doc)
		label = render_document_index_label doc, opts
		link_to label, url_for_document(doc), :class => opts[:linkClass] 
		# link_to label, url_for_document(doc), document_link_params(doc, opts)
	end

end