# frozen_string_literal: true

class ApplicationController < ActionController::API
  AuthorizationError = Class.new(StandardError)
  rescue_from AuthorizationError, with: :render_forbidden
  rescue_from ActionController::ParameterMissing, with: :render_bad_request

  private

  def render_forbidden
    head :forbidden
  end

  def render_bad_request
    head :bad_request
  end

  def authorize!
    token = request.headers['Authorization'].to_s.gsub('Bearer ', '')
    raise AuthorizationError if token.blank?
  end
end
