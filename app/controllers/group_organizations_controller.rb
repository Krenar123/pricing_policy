class GroupOrganizationsController < ApplicationController
    before_action :find_group

    def new_pricing
    end

    def create_pricing
        @organizations = @group_organization.organizations

        render json: PriceCreator.new(@organizations, price_params[:base_price]).to_json 
    end

    private

    def price_params
        params.require(:group_organization).permit(:model_type_name, :base_price)
    end

    def find_group
        @group_organization = GroupOrganization.find(params[:group_organization_id])
    end
end
