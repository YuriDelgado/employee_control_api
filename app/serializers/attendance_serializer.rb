class AttendanceSerializer < ActiveModel::Serializer
  attributes :status, :created_at, :updated_at, :diff_in_seconds
  belongs_to :user

  def user
    {
      id: object.user.id,
      name: object.user.name
    }
  end
end
