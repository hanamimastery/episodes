module Onboarding
  class RegistrationsController < ApplicationController
    before_action :authorize!

    def create
      model = deserialize(params)
      if (user = User.new(model)).valid?
        user.save
        render json: { user: user.attributes }, status: 201
      else
        render json: { errors: user.errors }, status: 422
      end
    end

    def deserialize(input)
      input.require(:user).permit(:email, :name)
    end
  end
end
