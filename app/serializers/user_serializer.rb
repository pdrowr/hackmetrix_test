# frozen_string_literal: true

# class TaskSerializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role
end
