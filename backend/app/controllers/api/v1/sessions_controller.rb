module Api
  module V1
    class SessionsController < Devise::SessionsController
      def create
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        data = {
          user_token: self.resource.authentication_token,
          user_email: self.resource.email,
          user_id: self.resource.id
        }
        render json: data, status: 201
      end
    end
  end
end
