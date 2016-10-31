require 'rails_helper'

RSpec.describe PublicationsController, type: :controller do
  let(:publication) { create(:publication) }
  let(:user) { create(:user) }

  # before do
  #   sign_in user
  # end

  describe "GET #index" do
    let(:publications) { FactoryGirl.create_list(:publication, 2) }

    before { get :index }

    it "return an array of all publications" do
      expect(assigns(:publications)).to match_array(publications)
    end

    it "renders index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do

    before do
      sign_in user
      get :show, params: { id: publication }
    end
  
    it "assigns the requested publication to @publication" do
      expect(assigns(:publication)).to eq publication
    end

    it "renders show view" do
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: publication } }
    
    it "assigns the requested publication to @publication" do
      expect(assigns(:publication)).to eq publication
    end

    it "renders show edit" do
      expect(response).to render_template :edit
    end
  end

  describe "GET #new" do
    before { get :new }
    
    it "assigns a new publication" do
      expect(assigns(:publication)).to be_a_new(Publication)
    end

    it "renders show edit" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it 'saves the new publication in the db' do
        expect { post :create, params: { publication: FactoryGirl.attributes_for(:publication) } }.to change(Publication, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { publication: FactoryGirl.attributes_for(:publication) }
        expect(response).to redirect_to publication_path(assigns(:publication))
      end
    end

    context "with invalid attributes" do
      it 'does not save publication' do
        expect { post :create, params: { publication: FactoryGirl.attributes_for(:invalid_publication) } }.to_not change(Publication, :count)
      end

      it 're-renders new view' do
        post :create, params: { publication: FactoryGirl.attributes_for(:invalid_publication) }
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    context "valid attributes" do
      it 'assings the requested publication to @publication' do
        patch :update, params: { id: publication, publication: FactoryGirl.attributes_for(:publication) }
        expect(assigns(:publication)).to eq publication
      end

      it 'changes publication attributes' do
        patch :update, params: { id: publication, publication: { title: "asd", description: "czx" } }
        publication.reload
        expect(publication.title).to eq "asd"
        expect(publication.description).to eq "czx"
      end

      it 'redirects to the updated publication' do
        patch :update, params: { id: publication, publication: FactoryGirl.attributes_for(:publication) }
        expect(response).to redirect_to publication
      end
    end

    context "invalid attributes" do
      before { patch :update, params: { id: publication, publication: { title: "asd", description: nil } } }

      it 'does not change publication attributes' do
        publication.reload
        expect(publication.title).to eq "MyString"
        expect(publication.description).to eq "MyText"
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end

  end

  describe "DELETE #destroy" do
    before { publication }

    it "delete publication" do
      expect { delete :destroy, params: { id: publication } }.to change(Publication, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: publication }
      expect(response).to redirect_to publications_path
    end 

  end

end
