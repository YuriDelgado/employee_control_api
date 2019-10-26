json.date data.first
json.attendances do
  json.array! data.last, partial: 'api/admin/attendances/attendance', as: :attendance
end
