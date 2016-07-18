require 'rails_helper'

RSpec.describe Trail, type: :model do
  it { is_expected.to have_valid(:name).when('Old Bridle Path') }
  it { is_expected.to have_valid(:park_name).when('Franconia Notch') }
  it { is_expected.to have_valid(:lat).when(42.3601) }
  it { is_expected.to have_valid(:lng).when(42.3601) }
  it { is_expected.to have_valid(:distance).when(2.9) }
  it { is_expected.to have_valid(:rating).when(5) }
  it { is_expected.to have_valid(:hiked).when(true) }
  it { is_expected.to have_valid(:duration).when(25.12) }
  it { is_expected.to have_valid(:description).when("Really liked this trail") }
end
