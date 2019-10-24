class AddDiffInSecondsToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :diff_in_seconds, :integer, null: false, default: 0
  end
end
