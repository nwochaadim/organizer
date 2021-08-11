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
    let(:params) do
      { task: { notes: 'Some notes', name: 'New task', starts_at: Time.now } }
    end

    context 'with valid params' do
      it 'creates the task' do
        expect {
          post :create, params: params
        }.to change(Task, :count).by(1)
      end

      it 'redirects to the task' do
        post :create, params: params

        expect(response).to redirect_to(Task.last)
      end
    end

    context 'with invalid params' do
      let(:params) do
        { task: { notes: '', name: 'New task', starts_at: Time.now } }
      end

      it 'does not create the task' do
        expect {
          post :create, params: params
        }.to_not change(Task, :count)
      end

      it 'renders the new template' do
        post :create, params: params

        expect(response).to render_template('new')
      end
    end
  end

  describe '#update' do
    let(:task) { create :task, name: 'Test' }

    context 'with valid params' do
      it 'updates the task' do
        create :task_membership, task: task, user: user

        expect {
          put :update, params: { id: task.id, task: { name: 'Updated Name' } }
        }.to change { task.reload.name }.to('Updated Name')
      end
    end

    context 'with invalid params' do
      it 'does not update the task' do
        create :task_membership, task: task, user: user

        expect {
          put :update, params: { id: task.id, task: { name: '' } }
        }.to_not change { task.reload.name }
      end
    end
  end

  describe '#destroy' do
    let(:task) { create :task, name: 'Test' }

    it 'soft deletes the task' do
      create :task_membership, task: task, user: user

      delete :destroy, params: { id: task.id }

      expect(task.reload.deleted_at).to be_present
    end

    it 'redirects to the task index' do
      create :task_membership, task: task, user: user

      delete :destroy, params: { id: task.id }

      expect(response).to redirect_to(tasks_path)
    end
  end
end
