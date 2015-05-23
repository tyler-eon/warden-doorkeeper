require "warden"

class Warden::Strategies::Doorkeeper < ::Warden::Strategies::Base
  VERSION = "0.2.0"

  attr_reader :token, :scope

  def initialize(env, scope=nil)
    super

    @scope = scope
  end

  def valid?
    @token = ::Doorkeeper::OAuth::Token.authenticate(request, *Doorkeeper.configuration.access_token_methods)
    @token && @token.accessible? && @token.acceptable?(@scope)
  end

  def authenticate!
    user = User.where(id: @token.resource_owner_id).first
    if user
      success!(user)
    else
      fail!("No such user")
    end
  end

  # Returns the configuration data for the default user scope.
  def config
    scopes = env["warden"].config[:scope_defaults]
    if scopes && scopes[:user]
      scopes[:user][:config]
    else
      {}
    end
  end
end
