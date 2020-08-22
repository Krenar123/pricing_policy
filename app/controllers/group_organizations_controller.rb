class GroupOrganizationsController < ApplicationController
    before_action :find_group_organizations

    def create_pricing
        if @organizations.any?
            render json: PricingCreator.new(@organizations, price_params[:base_price]).call.to_json 
        else
            render json: { warning: 'There is no organization in this group' }
        end
    end

    private

    def price_params
        params.permit(:group_organization_id, :model_type_name, :base_price)
    end

    def find_group_organizations
        @group_organization = GroupOrganization.find(params[:group_organization_id])
        @organizations = @group_organization.organizations
    end
end
