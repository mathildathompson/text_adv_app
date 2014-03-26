# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  username               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attributes
  attr_accessible :email, :username, :password, :password_confirmation
  #relationships
  has_many :adventures
  #validations
  #username must be populated, a minimum of 8 characters and is unique
  validates :username, :presence => true, length: { minimum: 6 }, :uniqueness => { case_sensitive: false }, 
            format: { with: /\A[a-zA-Z0-9]+\Z/, message: "only allows alphanumeric characters" }


end
