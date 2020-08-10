# frozen_string_literal: true

# class Task
class Task < ApplicationRecord
  # Relations
  belongs_to :user
  
  # Validations
  validates_presence_of :title, :name
end
