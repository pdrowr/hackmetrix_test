# frozen_string_literal: true

module Api
  module V1
    module Admin
      # class TasksController
      class TasksController < ApplicationController
        before_action :authenticate_api_user!
        before_action :validate_admin_user!

        def index
          tasks = Task.all.includes(:user)
          render_success(tasks)
        end

        def create
          task = Task.new(tasks_params)
          handle_persisted_response(task)
        end

        def update
          task = Task.find(params.dig(:id))
          return render_success(task) if task.update(tasks_params)

          render_error(task)
        rescue ActiveRecord::RecordNotFound => e
          render_error(e)
        end

        private

        def tasks_params
          params.require(:task).permit(:title, :name, :user_id)
        end

        def validate_admin_user!
          return if current_api_user.admin?

          render_unauthorized(
            'Houston we have a problem! Only admin users can create Tasks'
          )
        end
      end
    end
  end
end
