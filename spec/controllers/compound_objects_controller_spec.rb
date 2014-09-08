describe 'CompoundObjectsController' do
  let (:master_identifier) {"AOH1093X20140828fred"}
  let (:title) { "<h1>Welcome to #{master_identifier}</h1>" }
  let (:date) { "2014-08-31" }

  subject (:compound_object_controller) { CompoundObjectsController.new }

  describe 'Composed Object' do
    let (:transcript) do
      t = FactoryGirl.build(:transcript)
      Transcript.create(master_identifier: t.master_identifier, title: t.title, type: t.type)
    end

    let (:photograph) do
      p = FactoryGirl.build(:photograph)
      Photograph.create(master_identifier: p.master_identifier, title: p.title, type: p.type)
    end

    it "renders title" do
      expect(subject.render_title(master_identifier)).to eq(title) 
    end

    # TODO: Render_objects should return a title.
    xit "renders transcript object" do
      subject.render_objects(master_identifier)
      expect(subject.render_objects(master_identifier)).to include(transcript.title) 
    end

    # TODO: Render_objects should return a title.
    xit "renders photograph object" do
      subject.render_objects(master_identifier)
      expect(subject.render_objects(master_identifier)).to include(photograph.title) 
    end
  end
end
