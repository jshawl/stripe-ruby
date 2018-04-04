module Stripe
  class UsageRecord < APIResource
    def self.create(params = {}, opts = {})
      req_params = params.clone.delete_if {|key, _value| key == :subscription_item}
      resp, opts = request(:post, "/v1/subscription_items/#{params[:subscription_item]}/usage_records", req_params, opts)
      Util.convert_to_stripe_object(resp.data, opts)
    end

    OBJECT_NAME = "usage_record".freeze
  end
end
