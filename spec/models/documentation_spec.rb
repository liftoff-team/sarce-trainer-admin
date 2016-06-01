# == Schema Information
#
# Table name: documentations
#
#  id         :integer          not null, primary key
#  name       :string
#  short_name :string
#  cover_path :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Documentation do
  subject { build(:documentation) }

  describe 'validations' do
    it { is_expected.to be_valid } # test that factory is valid

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:short_name) }
    it { is_expected.to validate_presence_of(:cover_path) }
  end
end
