FactoryBot.define do
  factory :organization do
    name { 'OrganizationTest' }
    public_name { 'TestOrganization public name' }
    organization_type { 'Service' }
    pricing_policy { 'Flexible' }
    group_organization
  end
end
