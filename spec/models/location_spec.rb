require 'rails_helper'

RSpec.describe Location do
  describe 'associations' do
    it { should belong_to(:organization) }
  end
end
