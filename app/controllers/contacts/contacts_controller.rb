# frozen_string_literal: true

module Contacts
  # user manangement contacts controller
  class ContactsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_contact, except: %i[index create]

    def index
      render json: current_user.contacts, status: :ok
    end

    def show
      render json: @contact, status: :ok
    end

    def create
      contact = current_user.contacts.new contact_params

      if contact.save
        render json: contact, status: :created
      else
        render json: { errors: contact.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @contact.update contact_params
        render json: @contact, status: :created
      else
        render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      render json: {}, status: :no_content if @contact.destroy
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :address, :date_of_birth)
    end

    def set_contact
      @contact = current_user.contacts.find params[:id]
    end
  end
end
