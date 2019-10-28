class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role
  has_many :attendances

  def attendances
    object.attendances.where({created_at: DateTime.now.all_day}).last
  end
end