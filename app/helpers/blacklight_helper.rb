module BlacklightHelper
	include Blacklight::BlacklightHelperBehavior
	# def link_to_document(doc, opts = {:label => nil, :counter => nil})
	# 	opts[:label] ||= blacklight_config.index.show_link.to_sym
	# 	label = render_document_index_label doc, opts
	# 	link_to label, document_or_object_url(doc)
	# end

	def link_to_document(doc, opts={:label=>nil, :counter => nil, :link_class => nil})
		opts[:label] ||= document_show_link_field(doc)
		label = render_document_index_label doc, opts
		link_to label, url_for_document(doc), :class => opts[:link_class] 
	end
end