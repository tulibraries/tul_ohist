# -*- encoding : utf-8 -*-
require 'blacklight/catalog'

class CatalogController < ApplicationController

  include Blacklight::Catalog
  include Hydra::Controller::ControllerBehavior
  include BlacklightAdvancedSearch::ParseBasicQ
  # These before_filters apply the hydra access controls
  #before_filter :enforce_show_permissions, :only=>:show
  # This applies appropriate access controls to all solr queries
  #CatalogController.solr_search_params_logic += [:add_access_controls_to_solr_params]


  configure_blacklight do |config|
    config.default_solr_params = {
      :qf => 'title_tesim date_tesim repository_tesim format_tesim type_tesim language_tesim geographic_subject_tesim organization_building_tesim notes_tesim personal_names_tesim location_tesim physical_description_tesim document_content_tesim doi_tesim digital_collection_tesim',
      :qt => 'search',
      :rows => 10
    }

    # solr field configuration for search results/index views
    config.index.title_field = 'title_tesim'
    config.index.display_type_field = 'active_fedora_model_ssi'


    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _tsimed_ in a page.
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.
    #
    # :show may be set to false if you don't want the facet to be drawn in the
    # facet bar

    config.add_facet_field solr_name('subject', :facetable), :label => 'Subject', :limit => true
    config.add_facet_field solr_name('type', :facetable), :label => 'Type', :limit => true
    config.add_facet_field solr_name('language', :facetable), :label => 'Language', :limit => true
    config.add_facet_field solr_name('format', :facetable), :label => 'Format', :limit => true

    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.default_solr_params[:'facet.field'] = config.facet_fields.keys
    #use this instead if you don't want to query facets marked :show=>false
    #config.default_solr_params[:'facet.field'] = config.facet_fields.select{ |k, v| v[:show] != false}.keys


    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    config.add_index_field solr_name('title', :stored_searchable, type: :string), :label => 'Title'
    config.add_index_field solr_name('subject', :stored_searchable, type: :string), :label => 'Subject'


    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    config.add_show_field solr_name('title', :stored_searchable, type: :string), :label => 'Title'
    config.add_show_field solr_name('subject', :stored_searchable, type: :string), :label => 'Subject', :link_to_search => 'subject_sim'

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.

    config.add_search_field 'all_fields', :label => 'All Fields'

    #THIS WORKS -- DO WE NEED pf SOLR NAME?  
    config.add_search_field('Title') do |field|
      solr_name = solr_name("title_tesim", :stored_searchable, type: :string)
      field.solr_local_parameters = {
        :qf => 'title_tesim',
        :pf => solr_name
      }
    end


    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields.

    # Specifying a :qt only to show it's possible, and so our internal automated
    # tests can test it. In this case it's the same as
    # config[:default_solr_parameters][:qt], so isn't actually neccesary.
    config.add_search_field('subject') do |field|
      solr_name = solr_name("subject_tesim", :stored_searchable, type: :string)
      field.qt = 'search'
      field.solr_local_parameters = {
        :qf => 'subject_tesim',
        :pf => '$subject_pf'
      }
    end

    config.add_search_field('People Mentioned') do |field|
      solr_name = solr_name("personal_names_tesim", :stored_searchable, type: :string)
      field.qt = 'search'
      field.solr_local_parameters = {
        :qf => 'personal_names_tesim',
        :pf => '$personal_names_pf'
      }
    end

    config.add_search_field('Interview Content') do |field|
      solr_name = solr_name("document_content_tesim", :stored_searchable, type: :string)
      field.qt = 'search'
      field.solr_local_parameters = {
        :qf => 'document_content_tesim',
        :pf => '$document_content_pf'
      }
    end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    config.add_sort_field 'score desc, pub_date_dtsi desc, title_tesi asc', :label => 'relevance'
    config.add_sort_field 'narrator_tesi asc, title_tesi asc', :label => 'narrator'
    config.add_sort_field 'title_tesi asc, pub_date_dtsi desc', :label => 'title'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5
  end



end
