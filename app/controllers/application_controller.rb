# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::Concerns::ResponseHandler
end
