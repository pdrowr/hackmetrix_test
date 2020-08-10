# frozen_string_literal: true

module Api
  module V1
    module Overrides
      # class RegistrationController
      class RegistrationController < DeviseTokenAuth::RegistrationsController
        private

        def sign_up_params
          params.permit(:name, :email, :password, :password_confirmation, :role)
        end
      end
    end
  end
end
