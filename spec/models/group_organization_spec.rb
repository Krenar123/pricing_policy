require 'rails_helper'

RSpec.describe GroupOrganization do
  describe 'associations' do
    it { should have_many(:organizations) }
    it { should belong_to(:country) }
  end
end
