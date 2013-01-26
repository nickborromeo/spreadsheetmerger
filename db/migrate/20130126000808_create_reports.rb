class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :file_name
      t.datetime :created_at
      t.integer :user_id

      t.timestamps
    end
  end
end
