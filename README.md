# Pricing policy app

## Synopsis

**PricingPolicy** its a implemented logic for returning calculated price. Models used are Country that has many Group_organizations, Group_organization that belongs to Country and has many Organizations, Organizations that belongs to G_o and might have connection with other organizations and has many locations and Location that belong to Organization. In ***Organization*** model has pricing_policy attribute depending on that and the base_price posted on form we will calculate the price of the organizations.

## Contribution

**Refactoring code**, e.g. improving the code without modifying the behavior is an area that can probably be done based on intuition and may not require much communication to be merged.

**Fixing bugs** may also not require a lot of communication, but the more the better. Please surround bug fixes with ample tests. Bugs are magnets for other bugs. Write tests near bugs!

### How to contribute

1.  Fork the project & clone locally.
2.  Create a branch, naming it contribute: git checkout -b contribute
3.  Push to the branch: git push origin contribute
4.  Create a pull request for your branch 🎉

Note: be sure to keep your fork in sync!

## Getting Started

### Setup

#### Requirements

Install these software at first


*  Ruby (recommended version => '2.6.6') - we recommend to use rbenv for installation
*  Rails (recommended version '6.0.3' must be in '>= 6.0.3.2')
*  PostgreSQL v => 10.12 or higher
*  Bundler v => 2.1.4 or higher

#### Installation

Once you clone this project from github or download it, make sure you run `update bundler` also after that `bundle install` to make sure every gem is successfully installed and ready to use.

### Starting the application

First thing you have to do is:
`rails db:create rails db:migrate & rails db:seed` . 
Or you can use `rails db:create` and than use `rails db:reset`

Before that if you have problem connecting with database you might use `sudo service postgresql start` - for Ubuntu

Before running the server i recommend you tu run:
    `rails routes` -> to see every possible route that you want to request.

After that you can start by typing in terminal:
    `rails server` -> to run the server ( check 'localhost:3000/routes')

- You might need to run `yarn install --check-files` if Yarn packages are out of date!


### Running tests

For testing i have user RSpec framework version `4.0.1`

To run all tests run:
`$ rspec` 

#### Nesseccary gems used for testing


*   gem 'rspec-rails', '~> 4.0.1'
*   gem 'factory_bot_rails' -> for creating factories ( model testing )
*   gem 'shoulda-matchers', '~> 4.0'

#### Other gems ( libraries ) that I used :

*   gem 'httparty'


# Describing the process 

### Example API Requests

#### Requesting to posting with group organization that has organizations
```
#=>
POST /model_type_prices/:group_organization_id

Required Body:

{
    'model_type_name': 'Test',
    'base_price': 10
}


#=> Example Response
{
    "table": {
        "success?":true,
        "payload": {
            "#\u003cOrganization:0x00005566b0bb7da0\u003e":83,
            "#\u003cOrganization:0x00005566b0df2458\u003e":66 
        }
    }
}
```

#### Requesting to posting with group organization that don't have organizations
```
#=>
POST /model_type_prices/:group_organization_id

Required Body:

{
    'model_type_name': 'Test',
    'base_price': 10
}


#=> Example Response
{
    "warning": "There is no organization in this group"
}
```

## Bugs and Features Requests

Submit to https://github.com/Krenar123/pricing_policy/issues