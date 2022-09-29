# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :contacts, class_name: 'Contact', inverse_of: :user, dependent: :destroy
  has_many :contact_files, class_name: 'ContactFile', inverse_of: :user, dependent: :destroy
end
