class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :employees, class_name: "User",
          foreign_key: "admin_id"
  belongs_to :admin, class_name: "User",
          optional: true
  has_many :attendances

  validates :admin_id, presence: true, if: :employee?
  validates :admin_id, absence: true, if: :admin?

  enum role: [:admin, :employee]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  def employees_attendances_by_date_range range_date
    employees.all
      .includes(:attendances)
      .where(attendances: {created_at: (range_date)})
  end

  def attendances_by_date_range range_date
    attendances.where(created_at: (range_date))
  end

  def test_group
    attendances.all
      .select('"attendances"."created_at"')
      .group('DATE("attendances"."created_at")')
      .sum('"attendances"."diff_in_seconds"')
  end
end
