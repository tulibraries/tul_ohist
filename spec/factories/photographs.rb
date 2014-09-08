FactoryGirl.define do
  factory :photograph do
    master_identifier ["AOH1093X20140828fred"]
    title ["Still image of Fred"]
    date ["2014-08-31"]
    type ["Photograph"]
    # CONTENTdm attributes
    date_created "2014-07-07"
    date_modified "2014-08-19"
    contentdm_number "4"
    contentdm_file_name "5.jpg"
    contentdm_file_path "/p16002coll21/image/5.jpg"
    contentdm_collection_id "p16002coll21"
  end
end
