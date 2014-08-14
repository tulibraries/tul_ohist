require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TranscriptsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Transcript. As you add validations to Transcript, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TranscriptsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all transcripts as @transcripts" do
      transcript = Transcript.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:transcripts)).to eq([transcript])
    end
  end

  describe "GET show" do
    it "assigns the requested transcript as @transcript" do
      transcript = Transcript.create! valid_attributes
      get :show, {:id => transcript.to_param}, valid_session
      expect(assigns(:transcript)).to eq(transcript)
    end
  end

  describe "GET new" do
    it "assigns a new transcript as @transcript" do
      get :new, {}, valid_session
      expect(assigns(:transcript)).to be_a_new(Transcript)
    end
  end

  describe "GET edit" do
    it "assigns the requested transcript as @transcript" do
      transcript = Transcript.create! valid_attributes
      get :edit, {:id => transcript.to_param}, valid_session
      expect(assigns(:transcript)).to eq(transcript)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Transcript" do
        expect {
          post :create, {:transcript => valid_attributes}, valid_session
        }.to change(Transcript, :count).by(1)
      end

      it "assigns a newly created transcript as @transcript" do
        post :create, {:transcript => valid_attributes}, valid_session
        expect(assigns(:transcript)).to be_a(Transcript)
        expect(assigns(:transcript)).to be_persisted
      end

      it "redirects to the created transcript" do
        post :create, {:transcript => valid_attributes}, valid_session
        expect(response).to redirect_to(Transcript.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved transcript as @transcript" do
        post :create, {:transcript => invalid_attributes}, valid_session
        expect(assigns(:transcript)).to be_a_new(Transcript)
      end

      it "re-renders the 'new' template" do
        post :create, {:transcript => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested transcript" do
        transcript = Transcript.create! valid_attributes
        put :update, {:id => transcript.to_param, :transcript => new_attributes}, valid_session
        transcript.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested transcript as @transcript" do
        transcript = Transcript.create! valid_attributes
        put :update, {:id => transcript.to_param, :transcript => valid_attributes}, valid_session
        expect(assigns(:transcript)).to eq(transcript)
      end

      it "redirects to the transcript" do
        transcript = Transcript.create! valid_attributes
        put :update, {:id => transcript.to_param, :transcript => valid_attributes}, valid_session
        expect(response).to redirect_to(transcript)
      end
    end

    describe "with invalid params" do
      it "assigns the transcript as @transcript" do
        transcript = Transcript.create! valid_attributes
        put :update, {:id => transcript.to_param, :transcript => invalid_attributes}, valid_session
        expect(assigns(:transcript)).to eq(transcript)
      end

      it "re-renders the 'edit' template" do
        transcript = Transcript.create! valid_attributes
        put :update, {:id => transcript.to_param, :transcript => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested transcript" do
      transcript = Transcript.create! valid_attributes
      expect {
        delete :destroy, {:id => transcript.to_param}, valid_session
      }.to change(Transcript, :count).by(-1)
    end

    it "redirects to the transcripts list" do
      transcript = Transcript.create! valid_attributes
      delete :destroy, {:id => transcript.to_param}, valid_session
      expect(response).to redirect_to(transcripts_url)
    end
  end

end
