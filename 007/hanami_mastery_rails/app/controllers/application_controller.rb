class ApplicationController < ActionController::API
  def call_action(action)
    action.call(request) do |result|
      result.success do |status:|
        head status
      end

      result.failure(:deserialize) do |error|
        head :bad_request
      end

      result.failure(:authorize) do |error|
        head 403
      end

      result.failure(Dry::Validation::Result) do |res|
        render json: { errors: res.errors.to_h }, status: 422
      end

      result.failure(:teapot) do |message:|
        render json: { errors: message }, status: 418
      end

      result.failure do |res|
        head 500
      end
    end
  end
end
