# frozen_string_literal: true

# frozen_string_literal :true

module Onboarding
  class RegistrationsController < ApplicationController
    before_action :authorize!

    def create
      user = User.new(user_params)

      if user.valid?
        if User.count.positive?
          message = 'too many subscriptions! Try again later'
          return render json: { errors: message }, status: 418
        end

        user.save
        head :created
      else
        render json: { errors: user.errors }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end
