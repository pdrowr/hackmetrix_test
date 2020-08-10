# frozen_string_literal: true

module Api
  module Concerns
    # class ResponseHandler
    module ResponseHandler
      extend ActiveSupport::Concern

      def render_success(record)
        render json: {
          success: true,
          record: record
        }, status: 200
      end

      def render_error(error)
        render json: { success: false, errors: error }, status: 422
      end

      def render_unauthorized(error)
        render json: { success: false, error: error }, status: 401
      end

      def handle_persisted_response(record)
        return render_success(record) if record.save

        render_error(record.errors.full_messages)
      end
    end
  end
end
