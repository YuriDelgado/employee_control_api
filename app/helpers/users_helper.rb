module UsersHelper
  def date_range_from_params params
    pivot_date = params[:pivot_date] || DateTime.yesterday
    date_word_range = params[:date_word_range] || "day"
    pivot_date.to_datetime.send("all_#{date_word_range}")
  end
end