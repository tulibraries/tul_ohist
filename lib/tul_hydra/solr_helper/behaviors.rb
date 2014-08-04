module TulHydra::SolrHelper::Behaviors
#  You could also add the logic here
#  def self.included base
#    base.solr_search_params_logic << :show_only_public_records
#  end

  # solr_search_params_logic methods take two arguments
  # @param [Hash] solr_parameters a hash of parameters to be sent to Solr (via RSolr)
  # @param [Hash] user_parameters a hash of user-supplied parameters (often via `params`)
  #def show_only_public_records solr_parameters, user_parameters
   # # add a new solr facet query ('fq') parameter that limits results to those with a 'public_b' field of 1 
   # solr_parameters[:fq] ||= []
   # solr_parameters[:fq] << 'public_b:1'
  #end
  
  def clear_upon_searching solr_parameters, user_parameters
    
    if user_parameters[:q].present?       
      
      #flash[:notice] = solr_parameters[:fq].join '   '
      #fq = (solr_parameters[:fq] || []).select { |x| x.starts_with? "{!raw f=type_sim}" }.first.to_s
      #solr_parameters[:fq] ||= []
      #solr_parameters[:fq].delete(fq)
     
      #EXAMPLE OF HARD-CODED ADDITION OF FACET
      #solr_parameters[:fq] << "{!raw f=subject_sim}Songs with piano"
      
      #ACTUALLY REMOVES FACETS FROM QUERIES
      #solr_parameters[:fq].clear
      
      
      #fields = solr_parameters[:fq]
      #facets_from_request(fields).map do |display_facet|
        
      #  render_facet_limit(display_facet)
      #end.compact
      #flash[:notice] = blacklight_config.facet_fields
      
    end
      #flash[:notice] = fq.join '   '
     
      

    #solr_parameters[:fq].delete(fq)
    solr_parameters

    
  end
  
  
  def facets_from_request(fields = solr_parameters[:fq])
      fields.map { |solr_field| facet_by_field_name(solr_field) }.compact
    end

end
