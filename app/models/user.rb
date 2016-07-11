# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  last_name              :string           not null
#  first_name             :string           not null
#  cis                    :string           not null
#  rank                   :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default("false")
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :first_name, :last_name, :cis, :rank, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_with_password(params = {})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[
        :password_confirmation].blank?
    end
    update_attributes(params)
  end
end
