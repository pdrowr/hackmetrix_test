# frozen_string_literal: true

# class User
class User < ActiveRecord::Base
  # Devise configuration
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
  include DeviseTokenAuth::Concerns::User

  # Defining user avalibles roles, default is: role_1
  ROLES = %w[role_1 role_2 admin].freeze
  enum role: ROLES

  # Relations
  has_many :tasks, dependent: :destroy
end
