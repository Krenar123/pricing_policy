class PricingCreator
    include HTTParty

    def initialize(organizations, base_price)
        @organizations = organizations
        @base_price = base_price
    end

    def call
        org_with_prices = Hash.new(0)

        @organizations.each do |org|
            if org.pricing_policy == 'Flexible'
                margin = HTTParty.get("http://reuters.com").count('a')
            elsif org.pricing_policy == '"Fixed'
                margin = HTTParty.get("https://developer.github.com/v3/#http-redirects").gsub(/[^a-z0-9\s]/i,  ' ').split.select{ |word| word == 'status' || word == 'Status' }.count
            else
                margin = HTTParty.get("https://www.yourlocalguardian.co.uk/sport/rugby/rss/").parsed_response.to_s.gsub(/\W+/,  ' ').split.select{ |word| word == 'pubDate' }.count
            end
            
            org_with_prices[org] = @base_price + margin
        end
    rescue HTTParty::Error => e
        OpenStruct.new({success?: false, error: e})
    else
        OpenStruct.new({success?: true, payload: org_with_prices})
    end
end