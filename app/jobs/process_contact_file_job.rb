# frozen_string_literal: true

require 'csv'

# job responsible for process the csv files and create user contacts
class ProcessContactFileJob < ApplicationJob
  queue_as :default

  attr_reader :contact_file

  def perform(contact_file)
    contact_file.processing!
    File.open(contact_file.csv_file.download) do |file|
      CSV.foreach(file, headers: true).with_index do |row, i|
        # TODO: validate the CSV content and create the Contacs here
      end
    end
  end
end
