class CreateGroupOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :group_organizations do |t|
      t.string :name
      t.string :organization_code
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
