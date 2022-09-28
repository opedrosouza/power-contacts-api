# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { build(:contact) }

  it 'has a working factory' do
    expect(contact).to be_valid
    contact.save
    expect(contact).to be_persisted

    expect(contact.name).to_not be_nil
  end

  describe 'relationships' do
    subject { create(:contact) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    let(:contact) { build(:contact) }

    it { expect(contact).to validate_presence_of(:email) }
    it { expect(contact).to validate_presence_of(:phone) }
    it { expect(contact).to validate_presence_of(:address) }

    let(:invalid_contact_name) { build(:contact, name: 'pedro-souza') }
    let(:invalid_contact_email) { build(:contact, email: 'pedro') }

    it 'do not have dashes' do
      expect(invalid_contact_name).to_not be_valid
    end

    it 'do not have valid email' do
      expect(invalid_contact_email).to_not be_valid
    end
  end
end
