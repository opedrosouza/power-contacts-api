# frozen_string_literal: true

# controller to handle file upload and see the statuses of file processing
class ContactFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_file, only: %i[show]

  def index
    render json: current_user.contact_files, status: :ok
  end

  def show
    render json: @file, status: :ok
  end

  def create
    file = current_user.contact_files.new contact_file_params

    if file.save
      render json: file, status: :created
    else
      render json: { errors: file.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def contact_file_params
    params.require(:contact_file).permit(:csv_file)
  end

  def set_file
    @file = current_user.contact_files.find params[:id]
  end
end
