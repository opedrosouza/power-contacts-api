# frozen_string_literal: true

# Controller to check if the app is running
class HealthController < ApplicationController
  def index
    render json: { message: "I'm alive :p" }, status: :ok
  end
end
