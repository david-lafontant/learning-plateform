require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/course_modules', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # CourseModule. As you add validations to CourseModule, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      CourseModule.create! valid_attributes
      get course_modules_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      course_module = CourseModule.create! valid_attributes
      get course_module_url(course_module)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_course_module_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      course_module = CourseModule.create! valid_attributes
      get edit_course_module_url(course_module)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new CourseModule' do
        expect do
          post course_modules_url, params: { course_module: valid_attributes }
        end.to change(CourseModule, :count).by(1)
      end

      it 'redirects to the created course_module' do
        post course_modules_url, params: { course_module: valid_attributes }
        expect(response).to redirect_to(course_module_url(CourseModule.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new CourseModule' do
        expect do
          post course_modules_url, params: { course_module: invalid_attributes }
        end.to change(CourseModule, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post course_modules_url, params: { course_module: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested course_module' do
        course_module = CourseModule.create! valid_attributes
        patch course_module_url(course_module), params: { course_module: new_attributes }
        course_module.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the course_module' do
        course_module = CourseModule.create! valid_attributes
        patch course_module_url(course_module), params: { course_module: new_attributes }
        course_module.reload
        expect(response).to redirect_to(course_module_url(course_module))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        course_module = CourseModule.create! valid_attributes
        patch course_module_url(course_module), params: { course_module: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested course_module' do
      course_module = CourseModule.create! valid_attributes
      expect do
        delete course_module_url(course_module)
      end.to change(CourseModule, :count).by(-1)
    end

    it 'redirects to the course_modules list' do
      course_module = CourseModule.create! valid_attributes
      delete course_module_url(course_module)
      expect(response).to redirect_to(course_modules_url)
    end
  end
end
