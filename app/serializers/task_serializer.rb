# frozen_string_literal: true

# class TaskSerializer
class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :name

  belongs_to :user
end
