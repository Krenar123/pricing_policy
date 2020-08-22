require 'rails_helper'

RSpec.describe "PricingLogicRequests" do
  describe 'Passing attributes with 3 different pricing policy' do
    context 'when pricing policy is Flexible and base price 10' do
      let(:group_organization) { create(:group_organization) }
      let(:base_price) { 10 }

      it 'should return the organizations of group_organizations with how many letters \'a\' appears in http://reuters.com divide by 100' do
        result = base_price + HTTParty.get("http://reuters.com").count('a').to_i / 100
        create(:organization, group_organization: group_organization)

        post_params = {
          params: {
            model_type_name: 'Nope',
            base_price: base_price
          }
        }

        post "/model_type_prices/#{group_organization.id}", post_params

        expect(response).to have_http_status(:ok)
        expect(response.body).to include(result.to_s)
      end

      it 'should return the organizations of group_organizations with how many words \'status\' appears in https://developer.github.com/v3/#http-redirects' do
        result = base_price + HTTParty.get("https://developer.github.com/v3/#http-redirects").gsub(/[^a-z0-9\s]/i, ' ').split.select{ |word| word == 'status' || word == 'Status' }.count
        create(:organization, pricing_policy: 'Fixed', group_organization: group_organization)

        post_params = {
          params: {
            model_type_name: 'Nope',
            base_price: base_price
          }
        }

        post "/model_type_prices/#{group_organization.id}", post_params

        expect(response.body).to include(result.to_s)
      end

      it 'should return the organizations of group_organizations with how many letters \'a\' appears in http://reuters.com divide by 100' do
        result = base_price + HTTParty.get("https://www.yourlocalguardian.co.uk/sport/rugby/rss/").parsed_response.to_s.gsub(/\W+/, ' ').split.select{ |word| word == 'pubDate' }.count
        create(:organization, pricing_policy: 'Prestige', group_organization: group_organization)

        post_params = {
          params: {
            model_type_name: 'Nope',
            base_price: base_price
          }
        }

        post "/model_type_prices/#{group_organization.id}", post_params

        expect(response.body).to include(result.to_s)
      end
    end 
  end
end
