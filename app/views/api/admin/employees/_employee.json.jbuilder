json.id     employee.id
json.name   employee.name
json.email  employee.email
json.attendances do
  json.array! employee.attendances, partial: 'api/admin/attendances/attendance', as: :attendance
end