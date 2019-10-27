class GroupedAttendancesSerializer
  def initialize grouped_data
    @grouped_data = grouped_data
  end

  def serialize!
    @grouped_data.map{ |date, attendances| {
        date: date,
        attendances: attendances,
        sum: attendances.map(&:diff_in_seconds).reduce(:+)
      }
    }

  end
end