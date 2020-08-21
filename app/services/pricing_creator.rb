class PricingCreator
    include HTTParty

    def initialize(organizations, base_price)
        @organizations = organizations
        @base_price = base_price
    end

    def call
        org_with_prices
    rescue HTTParty::Error => e
        OpenStruct.new({ success?: false, error: e })
    else
        OpenStruct.new({ success?: true, payload: org_with_prices })
    end

    private

    def org_with_prices
        prices = Hash.new(0)

        @organizations.each do |org|
            prices[org] = (@base_price.to_i + calculate_margin(org))
        end

        prices
    end

    def calculate_margin(org)
        return HTTParty.get("http://reuters.com").count('a').to_i / 100  if org.pricing_policy == 'Flexible'
        return  HTTParty.get("https://developer.github.com/v3/#http-redirects").gsub(/[^a-z0-9\s]/i,  ' ').split.select{ |word| word == 'status' || word == 'Status' }.count if org.pricing_policy == 'Fixed'
        HTTParty.get("https://www.yourlocalguardian.co.uk/sport/rugby/rss/").parsed_response.to_s.gsub(/\W+/,  ' ').split.select{ |word| word == 'pubDate' }.count
    end
end