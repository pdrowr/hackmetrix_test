# frozen_string_literal: true

module Api
  module V1
    module Client
      # class TasksController
      class TasksController < ApplicationController
        before_action :authenticate_api_user!
        before_action :validate_admin_user!

        def index
          tasks = current_api_user.tasks
          render_success(tasks)
        end

        def show
          task = Task.find(params.dig(:id))
          validate_task_owner(task)
        rescue ActiveRecord::RecordNotFound => e
          render_error(e)
        end

        private

        def validate_admin_user!
          return unless current_api_user.admin?

          render_unauthorized(
            "Houston we have a problem! Tasks only belong to users with role_1 or role_2 and you're an admin user"
          )
        end

        def validate_task_owner(task)
          return render_success(task) if task.user_id.eql?(current_api_user.id)

          return render_unauthorized("You don't have acces to this Task!")
        end
      end
    end
  end
end
