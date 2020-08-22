require 'rails_helper'

RSpec.describe Organization do
  describe 'associations' do
    it { should have_many(:locations) }
    it { should belong_to(:group_organization) }
  end
end
