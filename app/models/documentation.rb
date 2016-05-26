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

class Documentation < ApplicationRecord
  validates :name, :short_name, :cover_path, presence: true
end
