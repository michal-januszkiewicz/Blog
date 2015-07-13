class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            }
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(name) = :value OR lower(email) = lower(:value)",
                                       { :value => login }]).first
    else
      where(conditions.to_hash).first
    end
  end

end
