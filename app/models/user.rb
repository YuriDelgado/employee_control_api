class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :employees, class_name: "User",
          foreign_key: "admin_id"
  belongs_to :admin, class_name: "User",
          optional: true
  has_many :attendances

  enum role: [:admin, :employee]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
end
