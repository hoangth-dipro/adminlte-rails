# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  address          :string
#  birth_day        :date
#  deleted_at       :datetime
#  email            :string
#  employee_code    :string
#  first_name       :string
#  github           :string
#  is_deactived     :boolean
#  join_company_day :date
#  last_name        :string
#  middle_name      :string
#  password_digest  :string
#  phone_number     :string
#  reset_digest     :string
#  reset_sent_at    :datetime
#  skype            :string
#  slack            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  strip_attributes
  has_paper_trail
  acts_as_paranoid
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, allow_nil: true
  validates :password, presence: true, allow_nil: true, length: { minimum: 6 }

end
