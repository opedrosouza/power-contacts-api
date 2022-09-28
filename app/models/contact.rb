# frozen_string_literal: true

# Contact activerecord class
class Contact < ApplicationRecord
  belongs_to :user, class_name: 'User', inverse_of: :contacts

  validates :name, :date_of_birth, :phone, :email, :address, presence: true
  validates :email, uniqueness: { scope: :user }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validate :name_should_not_have_dashes, on: %i[save create update]
  validate :birthday_format_validation, on: %i[save create update]

  private

  # TODO: Add phone validation
  # TODO: Find better way to date validation

  def name_should_not_have_dashes
    errors.add(:name, "can't have dashes") if name.match? Regexp.new('-')
  end

  def birthday_format_validation
    errors.add(:date_of_birth, "date_of_birth with invalid format") unless (date_of_birth.strftime('%F').match?(Regexp.new('\d{4}\-\d{2}\-\d{2}')) ||
    date_of_birth.strftime('%Y/%m/%d').match?(Regexp.new('\d{4}\/\d{2}\/\d{2}'))) &&
      Date.strptime(date_of_birth.to_s, '%Y-%m-%d')
  end
end
