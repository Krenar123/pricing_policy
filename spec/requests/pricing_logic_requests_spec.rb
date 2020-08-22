require 'rails_helper'

RSpec.describe "PricingLogicRequests" do
  describe "GET /pricing_logic_requests" do
    it "works! (now write some real specs)" do
      get pricing_logic_requests_index_path
      expect(response).to have_http_status(200)
    end
  end
end
