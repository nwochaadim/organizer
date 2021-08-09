require 'rails_helper'

describe TasksController, type: :controller do
  let(:user) { create :user }

  before { sign_in_as user }

  describe '#new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe '#index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'creates the task' do
      end
    end

    context 'with invalid params' do
      it 'does not create the task' do

      end
    end
  end

  describe '#edit' do
    it 'renders the edit template' do

    end
  end

  describe '#update' do
    context 'with valid params' do
      it 'updates the task' do

      end
    end

    context 'with invalid params' do
      it 'does not update the task' do

      end
    end
  end

  describe '#destroy' do
    it 'soft deletes the task' do

    end

    it 'redirects to the task index' do

    end
  end
end
