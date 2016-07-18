require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_valid(:email).when('testemail@gmail.com') }
  it { is_expected.to have_valid(:encrypted_password).when('password') }
  it { is_expected.to_not have_valid(:email).when('', nil) }
end
