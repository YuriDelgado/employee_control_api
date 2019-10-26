json.id     employee.id
json.name   employee.name
json.email  employee.email
json.data do
  json.array! employee.attendances.group_by(&:created_at_to_date_criteria), partial: 'dates_attendances', as: :data
end