class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(cel) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:cel].nil?
        where(conditions).first
      else
        where(cel: conditions[:cel]).first
      end
    end
  end

  validates :cel,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            }

  validates_format_of :cel, with: /^[0-9]{7,12}$/, :multiline => true



  has_many :user_addresses
end
