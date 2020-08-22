require 'rails_helper'

RSpec.describe Country do
  describe 'associations' do
    it { should have_many(:group_organizations) }
  end
end
