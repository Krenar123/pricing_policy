class AddGroupOrganizationToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :group_organization, unique: true
  end
end
