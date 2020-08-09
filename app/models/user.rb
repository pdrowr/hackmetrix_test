# frozen_string_literal: true

# class User
class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
  include DeviseTokenAuth::Concerns::User

  # Defining user avalibles roles, default is: 
  enum role: %w[role_1 role_2 admin]
end
