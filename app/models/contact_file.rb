# frozen_string_literal: true

# active_record ContactFile class
class ContactFile < ApplicationRecord
  belongs_to :user, class_name: 'User', inverse_of: :contact_files
  has_one_attached :csv_file
  enum status: { waiting: 0, processing: 1, failed: 2, finished: 3 }, _default: :waiting

  validates :csv_file, presence: true

  after_commit :process_file_job, on: :create

  private

  def process_file_job
    ProcessContactFileJob.perform_later(self)
  end
end
