require 'rails_helper'

describe Task do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:notes) }
  it { is_expected.to validate_presence_of(:name) }

  context 'uniqueness' do
    subject { build :task }

    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }
  end
end
