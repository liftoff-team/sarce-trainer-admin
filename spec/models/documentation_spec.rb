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

RSpec.describe Documentation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
