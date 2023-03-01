class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_response
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    private

    def invalid_response invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def not_found_response
        render json: {errors: "Record not Found"}, status: :not_found
    end
end
