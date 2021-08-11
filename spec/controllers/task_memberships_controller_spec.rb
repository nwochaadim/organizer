require 'rails_helper'

describe TaskMembershipsController do
  let(:user) { create :user }
  let(:task) { create :task }

  before { sign_in_as user }

  describe '#create' do

    context 'with valid params' do
      let(:collaborator) { create :user }

      it 'creates the task membership' do
        expect {
          post :create, params: { task_id: task.id, task_membership: { user_id: collaborator.id } }
        }.to change(TaskMembership, :count).by(1)
      end

      it 'redirects to the tasks index' do
        post :create, params: { task_id: task.id, task_membership: { user_id: collaborator.id } }

        expect(response).to redirect_to(tasks_path)
      end
    end

    context 'with invalid params' do
      it 'does not create the task membership' do
        post :create, params: { task_id: task.id, task_membership: { user_id: '' } }

        expect(response).to render_template('new')
      end
    end
  end

end
