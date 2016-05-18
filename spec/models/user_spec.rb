require 'rails_helper'
require 'support/factory_girl'

describe User do

  describe "have a valid factory" do
    it { expect(FactoryGirl.build(:user)).to be_valid }
  end
end
