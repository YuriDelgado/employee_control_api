class DateRangeObject
  
  def initialize params
    @params = params
  end 

  def from_params
    pivot_date = @params[:pivot_date] || DateTime.yesterday
    date_word_range = @params[:date_word_range] || "day"
    pivot_date.to_datetime.send("all_#{date_word_range}")
  end
end