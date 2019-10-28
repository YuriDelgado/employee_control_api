class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :attendances

  def attendances
    GroupedAttendancesSerializer.new(object.attendances.group_by(&:created_at_to_date_criteria)).serialize!
  end
end
