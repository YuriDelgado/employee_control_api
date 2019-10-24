class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :status, null: false, default: 0
      t.string :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
