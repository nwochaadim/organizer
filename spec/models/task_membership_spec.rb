require 'rails_helper'

describe TaskMembership do
  it { is_expected.to belong_to(:task) }
  it { is_expected.to belong_to(:user) }
end
