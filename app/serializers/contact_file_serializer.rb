# frozen_string_literal: true

# ContactFileSerializer class
class ContactFileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :file_url, :status, :rows_with_errors

  def file_url
    rails_blob_path(object.csv_file, disposition: 'attachment', only_path: true) if object.csv_file.attached?
  end
end
