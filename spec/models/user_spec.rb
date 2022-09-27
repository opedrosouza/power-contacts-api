# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'has a working factory' do
    expect(user).to be_valid
    user.save
    expect(user).to be_persisted

    expect(user.email).to_not be_nil
  end
end
