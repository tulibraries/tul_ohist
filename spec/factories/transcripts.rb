FactoryGirl.define do
  factory :transcript do
    transient do
      has_audio false
    end
    master_identifier ["AOH1093X20140828fred"]
    title ["Oral history interview with Fred"]
    date ["2014-08-31"]
    type ["Transcript"]
    # CONTENTdm attributes
    date_created "2014-07-07"
    date_modified "2014-08-07"
    contentdm_number "0"
    contentdm_file_name "1.pdf"
    contentdm_file_path "/p16002coll21/image/1.pdf"
    contentdm_collection_id "p16002coll21"
    # Related items
    repository_collection ["Oral Histories"]
    finding_aid_link ["http://findingaids.library.temple.edu/fred"]
    finding_aid_title ["Finding Aid of Fred"]
    online_exhibit_link ["http://online-exhibit.library.temple.edu"]
    online_exhibit_title ["Online Exhibit of Fred"]
    catalog_record_link ["http://catalog.library.temple.edu/fred"]
    catalog_record_title ["Catalog Record of Fred"]
    ensemble_identifier { has_audio ? ["fredsrecording"] : [] }
  end

  factory :transcript_list , class: Transcript do
    transient do
      has_audio false
    end
    # objectMetadata attributes
    sequence(:master_identifier) {|n| ["AOH1093X20160519fred#{n}"] }
    sequence(:title) {|n| ["Transcript #{n}"] }
    date ["2014-08-31"]
    type ["Transcript"]
    # CONTENTdm attributes
    date_created "2016-04-30"
    date_modified "2016-05-19"
    contentdm_number "0"
    contentdm_file_name "1.pdf"
    contentdm_file_path "/p16002coll22/image/1.pdf"
    contentdm_collection_id "p16002coll22"
    # Related items
    repository_collection ["Oral Histories"]
    finding_aid_link ["http://findingaids.library.temple.edu/fred"]
    finding_aid_title ["Finding Aid of Fred"]
    online_exhibit_link ["http://online-exhibit.library.temple.edu"]
    online_exhibit_title ["Online Exhibit of Fred"]
    catalog_record_link ["http://catalog.library.temple.edu/fred"]
    catalog_record_title ["Catalog Record of Fred"]
    ensemble_identifier { |n| has_audio ? ["fredsrecording#{n}"] : [] }
  end
  
  factory :diaspora_transcript, class: Transcript do
    master_identifier ["AOH1093X20140828fred"]
    title ["Oral history interview with Fred"]
    date ["2014-08-31"]
    type ["Transcript"]
    # CONTENTdm attributes
    date_created "2014-07-07"
    date_modified "2014-08-07"
    contentdm_number "0"
    contentdm_file_name "1.pdf"
    contentdm_file_path "/p16002coll21/image/1.pdf"
    contentdm_collection_id "p16002coll21"
    # Related items
    repository_collection ["Oral Histories"]
    finding_aid_link ["http://findingaids.library.temple.edu/fred"]
    finding_aid_title ["Finding Aid of Fred"]
    online_exhibit_link ["http://online-exhibit.library.temple.edu"]
    online_exhibit_title ["Online Exhibit of Fred"]
    catalog_record_link ["http://catalog.library.temple.edu/fred"]
    catalog_record_title ["Catalog Record of Fred"]
    digital_collection ["Migration from the African Diaspora"]
  end

end
