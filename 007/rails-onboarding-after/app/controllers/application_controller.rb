class ApplicationController < ActionController::API
  private

  def call_action(action)
    action.call(request) do |result|
      result.success { |status:| head status }

      result.failure(:deserialize) { head :bad_request }

      result.failure(:authorize) { head :forbidden }

      result.failure(Dry::Validation::Result) do |res|
        render json: { errors: res.errors.to_h }, status: :unprocessable_entity
      end

      result.failure(:teapot) do |message:|
        render json: { errors: message }, status: 418
      end

      result.failure { head :server_error }
    end
  end
end
