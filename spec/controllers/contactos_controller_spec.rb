require 'spec_helper'

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

describe ContactosController do

  # This should return the minimal set of attributes required to create a valid
  # Contacto. As you add validations to Contacto, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "nombre" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContactosController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    login_admin

    it "populates and array of contactos" do
      contacto = create(:contacto)
      get :index
      expect(assigns(:contactos)).to match_array [contacto]
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET new" do
    it "assigns a new Contacto to @contacto" do
      get :new, {}, valid_session
      expect(assigns(:contacto)).to be_a_new(Contacto)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    describe "with valid attributes" do
      it "saves the new contacto in the database" do
        expect {
          post :create, contacto: attributes_for(:contacto)
        }.to change(Contacto, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, contacto: attributes_for(:contacto)
        expect(response).to redirect_to root_url
      end
    end

    describe "with invalid attributes" do
      it "does not save the new messaje in the database" do
        expect{
          post :create,
          contacto: attributes_for(:invalid_contacto)
        }.to_not change(Contacto, :count)
      end

      it "re-renders the 'new' template" do
        post :create,
          contacto: attributes_for(:invalid_contacto)
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE destroy" do
    login_admin

    before :each do
      @contacto = create(:contacto)
    end

    it "deletes the contacto" do
      expect{
        delete :destroy, id: @contacto
      }.to change(Contacto, :count).by(-1)
    end

    it "redirects to contactos#index" do
      delete :destroy, id: @contacto
      expect(response).to redirect_to contactos_url
    end

  end

  describe "CSV output" do
    login_admin

    it "returns a CSV file" do
      get :index, format: :csv
      expect(response.headers['Content-Type']).to have_content 'text/csv'
    end

    it "returns content" do
      create(:contacto,
        nombre: 'Paul',
        telefono: '951754033',
        email: 'paul@kosmyka.com')
      get :index, format: :csv
      expect(response.body).to have_content 'Paul,951754033,paul@kosmyka.com'
    end

  end
end