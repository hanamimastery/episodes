# frozen_string_literal :true

module Onboarding
  class RegistrationsController < ApplicationController
    def create
      call_action(create_user)
    end

    private

    def create_user
      Endpoints::CreateUser::Action.new
    end
  end
end
