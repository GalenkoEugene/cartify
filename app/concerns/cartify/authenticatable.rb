module Cartify::Authenticatable
  extend ActiveSupport::Concern

  included do
    private

    def fast_authentification!
      return unless signed_in? and step != :login
      jump_to(:login) unless signed_in?
    end

    def signed_in?
      return unless respond_to?("#{Cartify.user_class}SignedIn?".underscore)
      public_send "#{Cartify.user_class}SignedIn?".underscore
    end
  end
end
